import XCTest

@MainActor
@dynamicMemberLookup
public protocol Element {
  var id: Query<XCUIElement> { get }
}

extension Element {

  public subscript<Value>(
    dynamicMember keyPath: KeyPath<XCUIElement, Value>
  ) -> Query<Value> {
    Query { id($0)[keyPath: keyPath] }
  }
}
