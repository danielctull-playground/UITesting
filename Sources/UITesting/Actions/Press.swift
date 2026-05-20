import XCTest

extension State {
  
  /// Sends a long press gesture to a hittable point computed for the element,
  /// holding for the specified duration.
  ///
  /// - Parameters:
  ///   - keyPath: The key path to the element to be pressed.
  ///   - duration: Duration in seconds.
  ///
  /// - Returns: The screen state.
  @discardableResult
  public consuming func press<Element: UITesting.Element>(
    _ keyPath: KeyPath<Screens.Head, Element>,
    for duration: TimeInterval
  ) throws -> Self where Element.Destination == Never {
    try perform(with: keyPath, XCUIElement.press(forDuration:), duration)
  }
}
