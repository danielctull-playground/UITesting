import XCTest

public struct Text: Element {
  public static let kind = XCUIElement.ElementType.staticText
  public typealias Destination = Never
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement, destination: Never.Type) {
    self.id = Query(id)
  }
}

extension Text {

  public var value: Query<String?> {
    id.map { $0.value as? String }
  }
}
