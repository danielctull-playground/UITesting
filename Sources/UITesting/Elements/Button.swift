import XCTest

public struct Button: Element {
  public let id: Query<XCUIElement>
  public init(id: @escaping (XCUIApplication) -> XCUIElement) {
    self.id = Query(id)
  }
}

extension Button {

  public init(_ key: String) {
    self.init(id: \.buttons[key])
  }
}

extension State {

  @discardableResult
  public consuming func tap(
    _ select: (Content) -> Button
  ) throws -> Self {
    let button = try element(select)
    button.id(application).tap()
    return self
  }
}
