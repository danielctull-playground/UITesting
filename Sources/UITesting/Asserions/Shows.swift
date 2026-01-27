
extension State {

  consuming func shows() throws -> Self {
    do {
      try element(at: \.id)
      return self
    } catch {
      throw ViewDoesNotShow(view: content)
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
