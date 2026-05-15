import XCTest

@MainActor
public struct State<Content: Screen>: ~Copyable {
  let application: XCUIApplication
  let content: Content
}

extension State {

  consuming func perform<E: Element, each Parameter>(
    with keyPath: KeyPath<Content, E>,
    _ action: @Sendable @MainActor (XCUIElement) -> (repeat each Parameter) -> Void,
    _ parameter: repeat each Parameter
  ) throws -> Self where E.Destination == Never {
    let element = try element(at: keyPath)
    action(element.id(application))(repeat each parameter)
    return self
  }

  consuming func perform<E: Element, each Parameter>(
    with keyPath: KeyPath<Content, E>,
    _ action: @Sendable @MainActor (XCUIElement) -> (repeat each Parameter) -> Void,
    _ parameter: repeat each Parameter
  ) throws -> State<E.Destination> {

    let element = try element(at: keyPath)
    action(element.id(application))(repeat each parameter)

    let destination = State<E.Destination>(
      application: application,
      content: E.Destination()
    )

    return try destination.shows()
  }
}
