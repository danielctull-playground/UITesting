import XCTest

extension Never: Screen, Element {
  public init() { fatalError() }
  public var id: Query<XCUIElement> { fatalError() }
}
