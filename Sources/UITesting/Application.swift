import XCTest

extension XCUIApplication {

  public func launch<Screen: UITesting.Screen>(
    expecting: Screen.Type
  ) throws -> UITesting.State<Screen> {
    launch()
    return try UITesting.State<Screen>(application: self, screen: Screen())
      .waitForScreenExistence()
  }
}

extension XCUIApplication {
  static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
}
