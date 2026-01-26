
extension State {

  consuming func shows() throws -> Self {
    let content = self.content
    do {
      return try expect(exists: \.id)
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
