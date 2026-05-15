import XCTest

@MainActor
@dynamicMemberLookup
public protocol Element {
  associatedtype Destination: Screen
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

// MARK: - Actions

extension State {

  @discardableResult
  public consuming func tap<E: Element>(
    _ keyPath: KeyPath<Content, E>
  ) throws -> Self where E.Destination == Never {
    let button = try element(at: keyPath)
    button.id(application).tap()
    return self
  }

  @discardableResult
  public consuming func tap<E: Element>(
    _ keyPath: KeyPath<Content, E>
  ) throws -> State<E.Destination> {
    let button = try element(at: keyPath)
    button.id(application).tap()

    let destination = State<E.Destination>(
      application: application,
      content: E.Destination()
    )

    return try destination.shows()
  }
}
