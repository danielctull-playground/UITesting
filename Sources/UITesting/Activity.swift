import XCTest

extension State {

  public consuming func activity<C, P>(
    _ name: String,
    perform action: (consuming Self) throws -> State<C, P>
  ) rethrows -> State<C, P> {
fatalError()
//    // State is non-copyable, so we must create a new State inside the
//    // XCTContext.runActivity closure. Also on the way out the state must be
//    // recreated because it can't be copied out of the closure.
//
//    let application = self.application
//    let previous =
//    let content = self.content
//
//    let new = try XCTContext.runActivity(named: name) { _ in
//      let state = State(application: application, content: content)
//      return try action(state).content
//    }
//
//    return State<C, P>(application: application, content: new)
  }
}
