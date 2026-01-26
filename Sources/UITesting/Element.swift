import XCTest

@MainActor
public protocol Element {
  var id: Lookup<XCUIElement> { get }
}


extension Element {

  public var label: Lookup<String> {
    id[keyPath: \.label]
  }
}

@dynamicMemberLookup
public struct Lookup<Value> {

  private let action: (Application) -> Value

  init(_ action: @escaping (Application) -> Value) {
    self.action = action
  }

  func callAsFunction(_ application: Application) -> Value {
    action(application)
  }

  public subscript<New>(
    dynamicMember keyPath: KeyPath<Value, New>
  ) -> Lookup<New> {
    Lookup<New> { action($0)[keyPath: keyPath] }
  }
}
