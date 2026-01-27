import XCTest

public struct Checkbox: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = Query(id)
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
