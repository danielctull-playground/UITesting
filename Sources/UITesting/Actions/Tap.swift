import XCTest

extension State {

  @discardableResult
  public consuming func tap<E: Element>(
    _ keyPath: KeyPath<Screen, E>
  ) throws -> Self where E.Destination == Never {
    try perform(with: keyPath, XCUIElement.tap)
  }

  @discardableResult
  public consuming func tap<E: Element>(
    _ keyPath: KeyPath<Screen, E>
  ) throws -> State<E.Destination> {
    try perform(with: keyPath, XCUIElement.tap)
  }

  @discardableResult
  public consuming func doubleTap<E: Element>(
    _ keyPath: KeyPath<Screen, E>
  ) throws -> Self where E.Destination == Never {
    try perform(with: keyPath, XCUIElement.doubleTap)
  }

  @discardableResult
  public consuming func doubleTap<E: Element>(
    _ keyPath: KeyPath<Screen, E>
  ) throws -> State<E.Destination> {
    try perform(with: keyPath, XCUIElement.doubleTap)
  }
}
