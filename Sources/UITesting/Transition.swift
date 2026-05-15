import XCTest

extension State {

  /// Transitions from the current screen to a new one whose arrival is
  /// triggered by an arbitrary action that has no tappable XCUIElement on the
  /// source screen — e.g. a deeplink (`XCUIDevice.shared.system.open(url:)`)
  /// or a search-field submission (`typeText("query\n")`).
  ///
  /// The action receives the `XCUIApplication` so it can perform raw
  /// interactions. Once it returns, a fresh `State<NewScreen>` is constructed
  /// and `.shows()` is asserted on it.
  ///
  /// ```swift
  /// try app.launch(expecting: HomeScreen.self)
  ///   .transition(to: PLPScreen.self) { app in
  ///     XCUIDevice.shared.system.open(URL(string: "mandsapp://l/men/mens-blazers")!)
  ///   }
  ///   .tap(\.back)
  /// ```
  @discardableResult
  public consuming func transition<NewScreen: Screen>(
    to _: NewScreen.Type,
    via action: (XCUIApplication) throws -> Void
  ) throws -> State<NewScreen> {
    try action(application)
    let destination = State<NewScreen>(
      application: application,
      content: NewScreen()
    )
    return try destination.shows()
  }
}
