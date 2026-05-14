import XCTest

extension XCUIApplication {

  public func launch<Content: Screen>(
    expecting: Content.Type
  ) throws -> UITesting.State<Content, Never> {
    launch()
    return try UITesting.State(application: self, content: Content())
      .shows()
  }
}

extension XCUIApplication {
  static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
}
