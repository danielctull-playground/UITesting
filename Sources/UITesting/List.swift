
public protocol List {
  associatedtype Head
  associatedtype Tail: List
  var head: Head { get }
  var tail: Tail { get }
}

extension Never: List {
  public var head: Never { fatalError() }
  public var tail: Never { fatalError() }
}

public struct Node<Current, Previous: List>: List {
  public let head: Current
  public var tail: Previous { _tail! }
  private let _tail: Previous?

  init(head: Current, tail: Previous) {
    self.head = head
    self._tail = tail
  }
}

extension Node where Previous == Never {

  init(head: Current) {
    self.head = head
    self._tail = nil
  }
}
