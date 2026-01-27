
public struct Query<Value> {

  private let action: (Application) -> Value

  init(_ action: @escaping (Application) -> Value) {
    self.action = action
  }

  func callAsFunction(_ application: Application) -> Value {
    action(application)
  }
}

extension Query {

  func map<New>(_ transform: @escaping (Value) -> New) -> Query<New> {
    Query<New> { transform(action($0)) }
  }
}
