import XCTest

public struct Button: Element {
  public let id: Lookup<XCUIElement>
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = Lookup(id)
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
