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
  public consuming func press<E: Element>(
    _ keyPath: KeyPath<Content, E>,
    for duration: TimeInterval
  ) throws -> Self where E.Destination == Never {
    try perform(with: keyPath, XCUIElement.press(forDuration:), duration)
  }
}
