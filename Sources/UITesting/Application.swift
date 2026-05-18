import XCTest

extension XCUIApplication {

  public func launch<Content: Screen>(
    expecting: Content.Type
  ) throws -> UITesting.State<Content> {
    launch()
    return try UITesting.State<Content>(application: self, content: Content())
      .waitForScreenExistence()
  }
}

extension XCUIApplication {
  static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
}
