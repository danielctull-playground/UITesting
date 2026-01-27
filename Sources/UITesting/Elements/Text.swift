import XCTest

public struct Text: Element {
  public let id: Lookup<XCUIElement>
  public init(element: @escaping (Application) -> XCUIElement) {
    self.id = Lookup(element)
  }
}
