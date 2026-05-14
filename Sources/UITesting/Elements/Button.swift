import XCTest

public struct Button<Destination: Screen>: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }

  public init(
    id: @escaping (XCUIApplication) -> XCUIElement,
    destination: Destination.Type = Never.self
  ) {
    self.id = Query(id)
  }
}

extension Button {

  public init(_ key: String, destination: Destination.Type = Never.self) {
    self.init(id: \.buttons[key], destination: destination)
  }
}

extension State {

  @discardableResult
  public consuming func tap<E: Element>(
    _ keyPath: KeyPath<Stack.Content, E>
  ) throws -> Self where E.Destination == Never {
    let element = try element(at: keyPath)
    element.id(application).tap()
    return self
  }

  @discardableResult
  public consuming func tap<E: Element>(
    _ keyPath: KeyPath<Stack.Content, E>
  ) throws -> State<Stack> {
    let element = try element(at: keyPath)
    element.id(application).tap()

    let destination = State<E.Destination, Content>(
      application: application,
      previous: content,
      content: E.Destination()
    )

    return try destination.shows()
  }
}
