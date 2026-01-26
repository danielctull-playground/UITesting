import XCTest

extension View {

  @discardableResult
  public func expect(_ element: some Element) throws -> Self {
    guard element.waitForExistence() else {
      throw ElementDoesNotExist(view: self, element: element)
    }
    return self
  }
}

// MARK: ElementDoesNotExist

@MainActor
struct ElementDoesNotExist<V: View, E: Element>: Error {
  fileprivate let view: V
  fileprivate let element: E
}

extension ElementDoesNotExist: @MainActor CustomStringConvertible {
  var description: String {
    "Element does not exist. \(view) \(element)"
  }
}
