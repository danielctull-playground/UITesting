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

//extension Never: Element {
//  public var id: Query<XCUIElement> { fatalError() }
//  public typealias Destination = Never
//}

extension Never: Screen {
  public typealias ID = Text<Never>
  public var id: Text<Never> { fatalError() }
  public init() { fatalError() }
}
