import XCTest

public struct Text<Destination: Screen>: Element {

  public let id: Query<XCUIElement>

  public init(
    id: @escaping (XCUIApplication) -> XCUIElement,
    destination: Destination.Type = Never.self
  ) {
    self.id = Query(id)
  }
}

extension Text {

  public init(_ key: String, destination: Destination.Type = Never.self) {
    self.init(id: \.buttons[key], destination: destination)
  }
}

extension Text {

  public var value: Query<String?> {
    id.map { $0.value as? String }
  }
}
