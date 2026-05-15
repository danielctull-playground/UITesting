import XCTest

extension Never: Screen, Element {
  public typealias Destination = Never
  public init() { fatalError() }
  public var id: Query<XCUIElement> { fatalError() }
}
