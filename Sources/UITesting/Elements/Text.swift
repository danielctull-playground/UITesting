import XCTest

public struct Text: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension Text {

  public var value: Query<String?> {
    id.map { $0.value as? String }
  }
}
