import XCTest

public struct Text: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}
