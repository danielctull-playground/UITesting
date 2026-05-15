import XCTest

extension State {

  @discardableResult
  func element<E: Element>(
    _ select: (Content) -> E
  ) throws -> E {
    let element = select(content)
    guard element.id(application).waitForExistence(timeout: 10) else {
      throw ElementDoesNotExist(content: content, element: element)
    }
    return element
  }

  @discardableResult
  public consuming func expect<E: Element>(
    exists select: (Content) -> E
  ) throws -> Self {
    try element(select)
    return self
  }

  @discardableResult
  public consuming func expect<E: Element>(
    notExists select: (Content) -> E
  ) throws -> Self {
    let element = select(content)
    let xcuiElement = element.id(application)
    let predicate = NSPredicate(format: "exists == false")
    let expectation = XCTNSPredicateExpectation(predicate: predicate, object: xcuiElement)
    let result = XCTWaiter().wait(for: [expectation], timeout: 10)
    guard result == .completed else {
      throw ElementExists(content: content, element: element)
    }
    return self
  }
}

// MARK: ElementDoesNotExist

@MainActor
struct ElementDoesNotExist<Content: Screen, E: Element>: Error {
  fileprivate let content: Content
  fileprivate let element: E

  init(content: Content, element: E) {
    self.content = content
    self.element = element
  }
}

extension ElementDoesNotExist: @MainActor CustomStringConvertible {
  var description: String {
    "Element does not exist. \(content) \(element)"
  }
}

// MARK: ElementExists

@MainActor
struct ElementExists<Content: Screen, E: Element>: Error {
  fileprivate let content: Content
  fileprivate let element: E
}

extension ElementExists: @MainActor CustomStringConvertible {
  var description: String {
    "Element exists when it was expected to be absent. \(content) \(element)"
  }
}
