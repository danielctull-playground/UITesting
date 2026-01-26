import XCTest

@MainActor
public protocol Element {
  var id: (Application) -> XCUIElement { get }
}
