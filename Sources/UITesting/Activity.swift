import XCTest

extension State {

  @discardableResult
  public consuming func activity<Return>(
    _ name: String,
    perform action: (consuming Self) throws -> State<Return>
  ) rethrows -> State<Return> {

    // State is non-copyable, so we must create a new State inside the
    // XCTContext.runActivity closure. Also on the way out the state must be
    // recreated because it can't be copied out of the closure.

    let application = self.application
    let content = self.content

    let new = try XCTContext.runActivity(named: name) { _ in
      let state = State(application: application, content: content)
      return try action(state).content
    }

    return State<Return>(application: application, content: new)
  }

  /// Async variant of `activity(_:perform:)`. Useful when the work performed
  /// inside the activity needs to `await` (e.g. swapping a network stub at a
  /// specific point in a UI flow) without breaking the surrounding chain.
  ///
  /// Note: `XCTContext.runActivity` is synchronous and cannot host an `await`,
  /// so this variant does **not** add a named entry to the test report — the
  /// `name` is currently informational only and may be surfaced by a future
  /// version once `XCTContext` gains async support.
  @discardableResult
  public consuming func activity<Return>(
    _ name: String,
    perform action: (consuming Self) async throws -> State<Return>
  ) async rethrows -> State<Return> {
    _ = name
    let application = self.application
    let content = self.content

    let state = State(application: application, content: content)
    let new = try await action(state).content

    return State<Return>(application: application, content: new)
  }
}
