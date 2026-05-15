import XCTest

public struct TextField: Element {
  public static let kind = XCUIElement.ElementType.textField
  public typealias Destination = Never
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement, destination: Never.Type) {
    self.id = Query(id)
  }
}
