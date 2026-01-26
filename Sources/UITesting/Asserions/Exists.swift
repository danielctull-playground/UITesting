import XCTest

extension State {

  @discardableResult
  public consuming func expect(
    exists keyPath: KeyPath<Content, some Element>
  ) throws -> Self {
    let element = content[keyPath: keyPath]
    guard element.waitForExistence() else {
      throw ElementDoesNotExist(content: content, element: element)
    }
    return self
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
