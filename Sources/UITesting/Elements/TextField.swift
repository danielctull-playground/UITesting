import XCTest

public struct TextField: Element {
  public typealias Destination = Never
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension TextField {

  public init(_ key: String) {
    self.init(id: \.textFields[key])
  }
}
