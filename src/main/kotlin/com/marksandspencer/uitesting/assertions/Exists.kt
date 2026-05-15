import XCTest

extension State {

  @discardableResult
  func element<E: Element>(
    at keyPath: KeyPath<Content, E>
  ) throws -> E {
    let element = content[keyPath: keyPath]
    guard element.id(application).waitForExistence(timeout: 10) else {
      throw ElementDoesNotExist(content: content, element: element)
    }
    return element
  }

  @discardableResult
  public consuming func expect(
    exists keyPath: KeyPath<Content, some Element>
  ) throws -> Self {
    try element(at: keyPath)
    return self
  }
}

// MARK: ElementDoesNotExist

@MainActor
struct ElementDoesNotExist<Content: Screen, E: Element>: Error {
  fileprivate let content: Content
  fileprivate let element: E
}

extension ElementDoesNotExist: @MainActor CustomStringConvertible {
  var description: String {
    "Element does not exist. \(content) \(element)"
  }
}
