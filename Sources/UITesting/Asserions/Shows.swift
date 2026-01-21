
extension View {

  func assertShows() throws {
    guard id.waitForExistence() else {
      throw ViewDoesNotShow(view: self)
    }
  }
}

// MARK: ViewDoesNotShow

@MainActor
struct ViewDoesNotShow<V: View>: Error {
  fileprivate let view: V
}

extension ViewDoesNotShow: @MainActor CustomStringConvertible {
  var description: String {
    "View does not show. \(view)"
  }
}
