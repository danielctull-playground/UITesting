import XCTest

@MainActor
public struct State<Screen: UITesting.Screen>: ~Copyable {
  let application: XCUIApplication
  let screen: Screen
}

extension State {

  consuming func perform<Element: UITesting.Element, each Parameter>(
    with keyPath: KeyPath<Screen, Element>,
    _ action: @Sendable @MainActor (XCUIElement) -> (repeat each Parameter) -> Void,
    _ parameter: repeat each Parameter
  ) throws -> Self where Element.Destination == Never {
    let element = try element(at: keyPath)
    action(element.id(application))(repeat each parameter)
    return self
  }

  consuming func perform<Element: UITesting.Element, each Parameter>(
    with keyPath: KeyPath<Screen, Element>,
    _ action: @Sendable @MainActor (XCUIElement) -> (repeat each Parameter) -> Void,
    _ parameter: repeat each Parameter
  ) throws -> State<Element.Destination> {

    let element = try element(at: keyPath)
    action(element.id(application))(repeat each parameter)

    let destination = State<Element.Destination>(
      application: application,
      screen: Element.Destination()
    )

    return try destination.waitForScreenExistence()
  }
}
