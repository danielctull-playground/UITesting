
extension State {

  consuming func waitForScreenExistence() throws -> Self {
    do {
      try waitForExistence(of: screens.head.id)
      return self
    } catch {
      throw ScreenDoesNotExist(screen: screens.head)
    }
  }
}

// MARK: ScreenDoesNotExist

@MainActor
struct ScreenDoesNotExist<Screen: UITesting.Screen>: Error {
  fileprivate let screen: Screen
}

extension ScreenDoesNotExist: @MainActor CustomStringConvertible {
  var description: String {
    "Screen does not exist. \(screen)"
  }
}
