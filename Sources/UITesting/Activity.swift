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
}
