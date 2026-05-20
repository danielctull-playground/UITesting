import XCTest

extension State {

  @discardableResult
  public consuming func tap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screens.Head, Element>
  ) throws -> Self where Element.Destination == Never {
    try perform(with: keyPath, XCUIElement.tap)
  }

  @discardableResult
  public consuming func tap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screens.Head, Element>
  ) throws -> State<Screens.Tail> where Element.Destination == Previous {
    try perform(with: keyPath, XCUIElement.tap)
  }

  @discardableResult
  public consuming func tap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screens.Head, Element>
  ) throws -> State<Node<Element.Destination, Screens>> {
    try perform(with: keyPath, XCUIElement.tap)
  }

  @discardableResult
  public consuming func doubleTap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screens.Head, Element>
  ) throws -> Self where Element.Destination == Never {
    try perform(with: keyPath, XCUIElement.doubleTap)
  }

  @discardableResult
  public consuming func doubleTap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screens.Head, Element>
  ) throws -> State<Node<Element.Destination, Screens>> {
    try perform(with: keyPath, XCUIElement.doubleTap)
  }
}
