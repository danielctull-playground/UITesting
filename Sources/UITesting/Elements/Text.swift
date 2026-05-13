import XCTest

public struct Text: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension Text {

  public init(_ key: String) {
    self.init(id: \.staticTexts[key])
  }
}

extension Text {

  public var value: Query<String?> {
    id.map { $0.value as? String }
  }
}
