import XCTest

public struct Checkbox: Element {
  public typealias Destination = Never
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
    _ keyPath: KeyPath<Content, Checkbox>
  ) throws -> Self {
    let checkbox = try element(at: keyPath)
    checkbox.id(application).tap()
    return self
  }
}
