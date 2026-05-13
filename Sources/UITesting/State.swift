import XCTest

@MainActor
public struct State<Content: Screen>: ~Copyable {
  let application: XCUIApplication
  let content: Content
}
