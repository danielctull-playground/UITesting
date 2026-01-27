import XCTest

@MainActor
public protocol Element {
  var id: Query<XCUIElement> { get }
}

extension Element {

  public var label: Query<String> {
    id[keyPath: \.label]
  }
}
