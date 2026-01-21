import XCTest

@MainActor
public protocol Element {
  var id: XCUIElement { get }
}

extension Element {

  func waitForExistence(timeout: TimeInterval = 10) -> Bool {
    id.waitForExistence(timeout: timeout)
  }
}
