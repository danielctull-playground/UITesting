import XCTest

extension State {

  func waitForExistence(of element: Query<XCUIElement>) throws {
    guard element(application).waitForExistence(timeout: 10) else {
      throw ElementDoesNotExist(screen: screens.head, element: element)
    }
  }

  @discardableResult
  public consuming func expect(
    exists keyPath: KeyPath<Screens.Head, some Element>
  ) throws -> Self {
    try waitForExistence(of: screens.head[keyPath: keyPath].id)
    return self
  }
}

// MARK: ElementDoesNotExist

@MainActor
struct ElementDoesNotExist<Screen: UITesting.Screen>: Error {
  fileprivate let screen: Screen
  fileprivate let element: Query<XCUIElement>
}

extension ElementDoesNotExist: @MainActor CustomStringConvertible {
  var description: String {
    "Element does not exist. \(screen) \(element)"
  }
}
