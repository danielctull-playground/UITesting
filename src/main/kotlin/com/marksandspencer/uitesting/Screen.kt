import XCTest

@MainActor
public protocol Screen {

  init()

  /// The element to look for to show that this view is on screen.
  associatedtype ID: Element
  var id: ID { get }
}

@available(*, deprecated, renamed: "Screen")
public typealias View = Screen
