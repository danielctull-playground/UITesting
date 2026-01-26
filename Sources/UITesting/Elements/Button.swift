import XCTest

public struct Button: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}

extension State where Value: View {

  @discardableResult
  public consuming func tap(
    _ keyPath: KeyPath<Value, Button>
  ) throws -> Self {
    let button = value[keyPath: keyPath]
    let s = try expect(button)
    button.id.tap()
    return s
  }
}
