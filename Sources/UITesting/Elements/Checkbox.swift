import XCTest

public struct Checkbox: Element {
  public typealias Destination = Never
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension Checkbox {

  public init(_ key: String) {
    self.init(id: \.checkBoxes[key])
  }
}
