import XCTest

public struct Button: Element {
  public let id: (Application) -> XCUIElement
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = id
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
