import XCTest

public struct Button: Element {
  public let id: Query<XCUIElement>
  public init(element: @escaping (Application) -> XCUIElement) {
    self.id = Query(element)
  }
}

extension State {

  @discardableResult
  public consuming func tap(
    _ keyPath: KeyPath<Content, Button>
  ) throws -> Self {
    let button = try expect(exists: keyPath)
    button.id(application).tap()
    return self
  }
}
