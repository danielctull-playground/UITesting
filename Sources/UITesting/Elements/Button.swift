import XCTest

public struct Button: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}

extension View {

  @discardableResult
  func tap(
    _ keyPath: KeyPath<Self, Button>
  ) throws -> Self {
    let button = self[keyPath: keyPath]
    try assertExists(button)
    button.id.tap()
    return self
  }
}
