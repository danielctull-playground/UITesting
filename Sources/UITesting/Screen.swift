import XCTest

@MainActor
public protocol Screen {

  init()

  /// The element to look for to show that this view is on screen.
  var id: Query<XCUIElement> { get }
}
