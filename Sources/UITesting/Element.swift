import XCTest

@MainActor
public protocol Element {
  var id: Lookup<XCUIElement> { get }
}


extension Element {

  public var label: Lookup<String> {
    id[keyPath: \.label]
  }
}
