import XCTest

extension State {

  /// Scrolls within a container until the element at `keyPath` exists in the
  /// UI hierarchy. Default container is the application's first scroll view.
  ///
  /// Throws `ElementDoesNotExist` if the element is still absent after
  /// `attempts` scrolls.
  @discardableResult
  public consuming func scroll<E: Element>(
    to keyPath: KeyPath<Content, E>,
    direction: ScrollDirection = .down,
    in container: KeyPath<XCUIApplication, XCUIElement>? = nil,
    attempts: Int = 10
  ) throws -> Self {
    let element = content[keyPath: keyPath]
    let xcui = element.id(application)
    let scrollContainer: XCUIElement = container.map { application[keyPath: $0] }
      ?? application.scrollViews.firstMatch

    var remaining = attempts
    while !xcui.exists, remaining > 0 {
      direction.swipe(scrollContainer)
      remaining -= 1
    }

    guard xcui.exists else {
      throw ElementDoesNotExist(content: content, element: element)
    }
    return self
  }
}

public enum ScrollDirection: Sendable {
  case up, down, left, right

  @MainActor
  func swipe(_ element: XCUIElement) {
    switch self {
    case .up: element.swipeDown()
    case .down: element.swipeUp()
    case .left: element.swipeRight()
    case .right: element.swipeLeft()
    }
  }
}
