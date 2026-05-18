import XCTest

@MainActor
public protocol Screen {

  init()

  /// The element to look for to show that this screen is in the hierarchy.
  var id: ID { get }
}
