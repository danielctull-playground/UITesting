import XCTest

public struct TextField: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}

extension State {

  @discardableResult
  public consuming func type(
    _ keyPath: KeyPath<Content, TextField>,
    _ text: String
  ) throws -> Self {
    let textField = content[keyPath: keyPath]
    let s = try expect(exists: keyPath)
    textField.id.typeText(text)
    return s
  }
}
