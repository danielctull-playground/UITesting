import XCTest

public struct Checkbox: Element {
  public static let kind = XCUIElement.ElementType.checkBox
  public typealias Destination = Never
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement, destination: Never.Type) {
    self.id = Query(id)
  }
}
