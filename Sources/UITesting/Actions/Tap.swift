import XCTest

extension State {

  @discardableResult
  public consuming func tap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screen, Element>
  ) throws -> Self where Element.Destination == Never {
    try perform(with: keyPath, XCUIElement.tap)
  }

  @discardableResult
  public consuming func tap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screen, Element>
  ) throws -> State<Element.Destination> {
    try perform(with: keyPath, XCUIElement.tap)
  }

  @discardableResult
  public consuming func doubleTap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screen, Element>
  ) throws -> Self where Element.Destination == Never {
    try perform(with: keyPath, XCUIElement.doubleTap)
  }

  @discardableResult
  public consuming func doubleTap<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screen, Element>
  ) throws -> State<Element.Destination> {
    try perform(with: keyPath, XCUIElement.doubleTap)
  }
}
