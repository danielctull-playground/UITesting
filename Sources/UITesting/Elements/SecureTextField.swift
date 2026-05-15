import XCTest

public struct SecureTextField: Element {
  public typealias Destination = Never
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension SecureTextField {

  public init(_ key: String) {
    self.init(id: \.secureTextFields[key])
  }
}
