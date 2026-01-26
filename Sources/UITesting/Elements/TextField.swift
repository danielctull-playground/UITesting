import XCTest

public struct TextField: Element {
  public let id: (Application) -> XCUIElement
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = id
  }
}

extension State {

  @discardableResult
  public consuming func type(
    _ keyPath: KeyPath<Content, TextField>,
    _ text: String
  ) throws -> Self {
    let textField = try expect(exists: keyPath)
    textField.id(application).typeText(text)
    return self
  }
}
