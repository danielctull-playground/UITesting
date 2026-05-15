import XCTest

public struct Checkbox: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension Checkbox {

  public init(_ key: String) {
    self.init(id: \.checkBoxes[key])
  }
}

extension State {

  @discardableResult
  public consuming func toggle(
    _ select: (Content) -> Checkbox
  ) throws -> Self {
    let checkbox = try element(select)
    checkbox.id(application).tap()
    return self
  }
}
