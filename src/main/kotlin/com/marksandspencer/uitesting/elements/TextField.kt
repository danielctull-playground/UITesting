import XCTest

public struct TextField: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension TextField {

  public init(_ key: String) {
    self.init(id: \.textFields[key])
  }
}

extension State {

  @discardableResult
  public consuming func type(
    _ text: String,
    in keyPath: KeyPath<Content, TextField>
  ) throws -> Self {
    let textField = try element(at: keyPath)
    textField.id(application).typeText(text)
    return self
  }
}
