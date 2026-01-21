import XCTest

@MainActor
protocol View {

  init()

  /// The element to look for to show that this view is on screen.
  var id: Element { get }
}
