import XCTest

public struct Text: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = Query(id)
  }
}
