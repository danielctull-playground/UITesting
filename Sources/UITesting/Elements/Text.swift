import XCTest

public struct Text: Element {
  public let id: (Application) -> XCUIElement
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = id
  }
}
