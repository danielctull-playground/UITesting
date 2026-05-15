import XCTest

extension Never: Screen, Element {
  public static let kind = XCUIElement.ElementType.any
  public typealias Destination = Never
  public init() { fatalError() }
  public init(id: @escaping (XCUIApplication) -> XCUIElement, destination: Never.Type) {
    fatalError()
  }
  public var id: Query<XCUIElement> { fatalError() }
}
