import XCTest

extension State {

  public consuming func activity<Destination: List>(
    _ name: String,
    perform action: (consuming Self) throws -> State<Destination>
  ) rethrows -> State<Destination> {

    // State is non-copyable, so we must create a new State inside the
    // XCTContext.runActivity closure. Also on the way out the state must be
    // recreated because it can't be copied out of the closure.

    let application = self.application
    let screens = self.screens

    let destination = try XCTContext.runActivity(named: name) { _ in
      let state = State(application: application, screens: screens)
      return try action(state).screens
    }

    return State<Destination>(application: application, screens: destination)
  }
}
