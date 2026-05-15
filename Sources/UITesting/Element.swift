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

extension State {

  func element<E: Element>(
    at keyPath: KeyPath<Content, E>
  ) throws -> E {
    let element = content[keyPath: keyPath]
    try exists(element.id)
    return element
  }
}
