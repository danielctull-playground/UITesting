import XCTest

extension Never: Screen {
  public init() { fatalError() }
  public var id: Query<XCUIElement> { fatalError() }
}
