import XCTest

public struct Button: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}

extension View {

  @discardableResult
  public func tap(
    _ keyPath: KeyPath<Self, Button>
  ) throws -> Self {
    let button = self[keyPath: keyPath]
    try expect(button)
    button.id.tap()
    return self
  }
}
