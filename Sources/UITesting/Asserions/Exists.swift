import XCTest

extension State {

  @discardableResult
  public func expect<E: Element>(
    exists keyPath: KeyPath<Content, E>
  ) throws -> E {
    let element = content[keyPath: keyPath]
    guard element.id(application).waitForExistence(timeout: 10) else {
      throw ElementDoesNotExist(content: content, element: element)
    }
    return element
  }
}

// MARK: ElementDoesNotExist

@MainActor
struct ElementDoesNotExist<Content: View, E: Element>: Error {
  fileprivate let content: Content
  fileprivate let element: E
}

extension ElementDoesNotExist: @MainActor CustomStringConvertible {
  var description: String {
    "Element does not exist. \(content) \(element)"
  }
}
