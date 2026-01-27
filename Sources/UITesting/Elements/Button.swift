import XCTest

public struct Button: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension State {

  @discardableResult
  public consuming func tap(
    _ keyPath: KeyPath<Content, Button>
  ) throws -> Self {
    let button = try element(at: keyPath)
    button.id(application).tap()
    return self
  }
}
