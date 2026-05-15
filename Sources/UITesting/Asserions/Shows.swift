
extension State {

  consuming func shows() throws -> Self {
    do {
      try exists(content.id)
      return self
    } catch {
      throw ViewDoesNotShow(view: content)
    }
  }
}

// MARK: ViewDoesNotShow

@MainActor
struct ViewDoesNotShow<V: Screen>: Error {
  fileprivate let view: V
}

extension ViewDoesNotShow: @MainActor CustomStringConvertible {
  var description: String {
    "View does not show. \(view)"
  }
}
