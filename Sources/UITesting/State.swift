import XCTest

@MainActor
public struct State<Screens: List>: ~Copyable where Screens.Head: Screen {
  let application: XCUIApplication
  let screens: Screens
}

extension State {

  consuming func perform<Element: UITesting.Element, each Parameter>(
    with keyPath: KeyPath<Screens.Head, Element>,
    _ action: @Sendable @MainActor (XCUIElement) -> (repeat each Parameter) -> Void,
    _ parameter: repeat each Parameter
  ) throws -> Self where Element.Destination == Never {
    let element = try element(at: keyPath)
    action(element.id(application))(repeat each parameter)
    return self
  }

  consuming func perform<Element: UITesting.Element, each Parameter>(
    with keyPath: KeyPath<Screens.Head, Element>,
    _ action: @Sendable @MainActor (XCUIElement) -> (repeat each Parameter) -> Void,
    _ parameter: repeat each Parameter
  ) throws -> State<Screens.Tail> where Element.Destination == Previous {

    let element = try element(at: keyPath)
    action(element.id(application))(repeat each parameter)

    let destination = State<Screens.Tail>(
      application: application,
      screens: screens.tail
    )

    return try destination.waitForScreenExistence()
  }

  consuming func perform<Element: UITesting.Element, each Parameter>(
    with keyPath: KeyPath<Screens.Head, Element>,
    _ action: @Sendable @MainActor (XCUIElement) -> (repeat each Parameter) -> Void,
    _ parameter: repeat each Parameter
  ) throws -> State<Node<Element.Destination, Screens>> {

    let element = try element(at: keyPath)
    action(element.id(application))(repeat each parameter)

    let branch = Node(
      head: Element.Destination(),
      tail: screens
    )

    let destination = State<Node<Element.Destination, Screens>>(
      application: application,
      screens: branch
    )

    return try destination.waitForScreenExistence()
  }
}
