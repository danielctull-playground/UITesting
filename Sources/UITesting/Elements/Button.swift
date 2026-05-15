import XCTest

public struct Button<Destination: Screen>: Element {
  public let id: Query<XCUIElement>

  public init(
    id: @escaping (XCUIApplication) -> XCUIElement,
    destination: Destination.Type = Never.self
  ) {
    self.id = Query(id)
  }
}

extension Button {

  public init(_ key: String, destination: Destination.Type = Never.self) {
    self.init(id: \.buttons[key], destination: destination)
  }
}
