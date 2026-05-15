import XCTest

public struct SecureTextField: Element {
  public static let kind = XCUIElement.ElementType.secureTextField
  public typealias Destination = Never
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement, destination: Never.Type) {
    self.id = Query(id)
  }
}
