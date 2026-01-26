import XCTest

@MainActor
public protocol View {

  init(application: Application)
  var application: Application { get }

  /// The element to look for to show that this view is on screen.
  associatedtype ID: Element
  var id: ID { get }
}

@MainActor
public struct State<Content: View>: ~Copyable {
  let content: Content
}
