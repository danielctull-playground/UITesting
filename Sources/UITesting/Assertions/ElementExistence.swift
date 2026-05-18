import XCTest

extension State {

  func waitForExistence(of element: Query<XCUIElement>) throws {
    guard element(application).waitForExistence(timeout: 10) else {
      throw ElementDoesNotExist(content: content, element: element)
    }
  }

  @discardableResult
  public consuming func expect(
    exists keyPath: KeyPath<Content, some Element>
  ) throws -> Self {
    try waitForExistence(of: content[keyPath: keyPath].id)
    return self
  }
}

// MARK: ElementDoesNotExist

@MainActor
struct ElementDoesNotExist<Content: Screen>: Error {
  fileprivate let content: Content
  fileprivate let element: Query<XCUIElement>
}

extension ElementDoesNotExist: @MainActor CustomStringConvertible {
  var description: String {
    "Element does not exist. \(content) \(element)"
  }
}
