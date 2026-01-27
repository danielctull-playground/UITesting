import XCTest

public struct Text: Element {
  public let id: Query<XCUIElement>
  public init(element: @escaping (Application) -> XCUIElement) {
    self.id = Query(element)
  }
}
