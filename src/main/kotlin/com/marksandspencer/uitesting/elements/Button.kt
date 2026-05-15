import XCTest

public struct Button<Destination: Screen>: Element {

  public static var kind: XCUIElement.ElementType { .button }

  public let id: Query<XCUIElement>

  public init(
    id: @escaping (XCUIApplication) -> XCUIElement,
    destination: Destination.Type = Never.self
  ) {
    self.id = Query(id)
  }
}
