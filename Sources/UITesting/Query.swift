
@dynamicMemberLookup
public struct Query<Value> {

  private let action: (Application) -> Value

  init(_ action: @escaping (Application) -> Value) {
    self.action = action
  }

  func callAsFunction(_ application: Application) -> Value {
    action(application)
  }

  public subscript<New>(
    dynamicMember keyPath: KeyPath<Value, New>
  ) -> Query<New> {
    Query<New> { action($0)[keyPath: keyPath] }
  }
}
