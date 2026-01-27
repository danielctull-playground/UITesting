import XCTest

@MainActor
public struct State<Content: View>: ~Copyable {
  let application: XCUIApplication
  let content: Content
}
