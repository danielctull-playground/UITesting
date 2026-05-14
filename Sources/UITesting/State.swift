import XCTest

@MainActor
public struct State<Stack: NavStack>: ~Copyable {
  let application: XCUIApplication
  let stack: Stack

  init(application: XCUIApplication, stack: Stack) {
    self.application = application
    self.stack = stack
  }
}

extension State {

  init<Content: Screen>(
    application: XCUIApplication,
    content: Content
  )  where Stack == Root<Content> {
    self.application = application
    self.stack = Root(content: content)
  }
}

extension State {

  func back<E: Element>(
    using keyPath: KeyPath<Stack.Content, E>
  ) throws -> State<Stack.Previous> {

    let element = try element(at: keyPath)
    element.id(application).tap()

    let destination = State<Stack.Previous>(
      application: application,
      stack: self.stack.previous
    )
    return try destination.shows()
  }
}

extension State where Stack.Previous == Never {

  @available(*, unavailable)
  func back() -> Never {
    fatalError()
  }
}

struct Stack<Content: Screen, Previous: NavStack>: NavStack {
  let content: Content
  let previous: Previous
}

struct Root<Content: Screen>: NavStack {
  let content: Content
  var previous: Never { fatalError() }
}

public protocol NavStack {
  associatedtype Content: Screen
  associatedtype Previous: NavStack
  var content: Content { get }
  var previous: Previous { get }
}

extension Never: NavStack {
  public var content: Never { fatalError() }
  public var previous: Never { fatalError() }
}
