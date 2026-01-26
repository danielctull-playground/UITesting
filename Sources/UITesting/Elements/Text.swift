import XCTest

public struct Text: Element {
  public let id: Lookup<XCUIElement>
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = Lookup(id)
  }
}
