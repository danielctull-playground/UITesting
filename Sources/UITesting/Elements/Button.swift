import XCTest

public struct Button: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}

extension State {

  @discardableResult
  public consuming func tap(
    _ keyPath: KeyPath<Content, Button>
  ) throws -> Self {
    let button = content[keyPath: keyPath]
    let s = try expect(button)
    button.id.tap()
    return s
  }
}
