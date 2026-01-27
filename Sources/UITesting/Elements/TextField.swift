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
    _ keyPath: KeyPath<Content, TextField>,
    _ text: String
  ) throws -> Self {
    let textField = try expect(exists: keyPath)
    textField.id(application).typeText(text)
    return self
  }
}
