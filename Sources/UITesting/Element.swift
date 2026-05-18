import XCTest

@MainActor
@dynamicMemberLookup
public protocol Element {
  associatedtype Destination: Screen
  static var kind: XCUIElement.ElementType { get }
  var id: ID { get }
  init(
    id: @escaping (XCUIApplication) -> XCUIElement,
    destination: Destination.Type
  )
}

extension Element {

  public init(_ key: String, destination: Destination.Type) {
    self.init(id: { $0.descendants(matching: Self.kind)[key] }, destination: destination)
  }
}

extension Element where Destination == Never {

  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.init(id: id, destination: Never.self)
  }

  public init(_ identifier: String) {
    self.init { $0.descendants(matching: Self.kind)[identifier] }
  }
}

extension Element {

  public subscript<Value>(
    dynamicMember keyPath: KeyPath<XCUIElement, Value>
  ) -> Query<Value> {
    Query { id($0)[keyPath: keyPath] }
  }
}

extension State {

  func element<Element: UITesting.Element>(
    at keyPath: KeyPath<Screen, Element>
  ) throws -> Element {
    let element = screen[keyPath: keyPath]
    try waitForExistence(of: element.id)
    return element
  }
}
