import XCTest

public struct SecureTextField: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension SecureTextField {

  public init(_ key: String) {
    self.init(id: \.secureTextFields[key])
  }
}

extension State {

  @discardableResult
  public consuming func type(
    _ text: String,
    in select: (Content) -> SecureTextField
  ) throws -> Self {
    let textField = try element(select)
    textField.id(application).typeText(text)
    return self
  }
}
