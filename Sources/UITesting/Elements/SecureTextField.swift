import XCTest

public struct SecureTextField: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension State {

  @discardableResult
  public consuming func type(
    _ text: String,
    in keyPath: KeyPath<Content, SecureTextField>
  ) throws -> Self {
    let textField = try element(at: keyPath)
    textField.id(application).typeText(text)
    return self
  }
}
