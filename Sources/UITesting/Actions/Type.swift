import XCTest

extension State {

  @discardableResult
  public consuming func type(
    _ text: String,
    in keyPath: KeyPath<Screen, TextField>
  ) throws -> Self {
    try perform(with: keyPath, XCUIElement.typeText, text)
  }

  @discardableResult
  public consuming func type(
    _ text: String,
    in keyPath: KeyPath<Screen, SecureTextField>
  ) throws -> Self {
    try perform(with: keyPath, XCUIElement.typeText, text)
  }
}
