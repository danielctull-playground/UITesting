import XCTest

extension State {

  @discardableResult
  public consuming func type(
    _ text: String,
    in keyPath: KeyPath<Screens.Head, TextField>
  ) throws -> Self {
    try perform(with: keyPath, XCUIElement.typeText, text)
  }

  @discardableResult
  public consuming func type(
    _ text: String,
    in keyPath: KeyPath<Screens.Head, SecureTextField>
  ) throws -> Self {
    try perform(with: keyPath, XCUIElement.typeText, text)
  }
}
