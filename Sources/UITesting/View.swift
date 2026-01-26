import XCTest

@MainActor
public protocol View {

  init()

  /// The element to look for to show that this view is on screen.
  associatedtype ID: Element
  var id: ID { get }
}

@MainActor
public struct State<Content: View>: ~Copyable {
  let application: Application
  let content: Content
}
