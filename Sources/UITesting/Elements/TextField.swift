import XCTest

public struct TextField: Element {
  public let id: Query<XCUIElement>
  public init(element: @escaping (Application) -> XCUIElement) {
    self.id = Query(element)
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
