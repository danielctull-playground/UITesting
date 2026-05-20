import XCTest

extension XCUIApplication {

  public func launch<Screen: UITesting.Screen>(
    expecting: Screen.Type
  ) throws -> UITesting.State<Node<Screen, Never>> {
    launch()
    return try UITesting.State(application: self, screens: Node(head: Screen()))
      .waitForScreenExistence()
  }
}

extension XCUIApplication {
  static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
}
