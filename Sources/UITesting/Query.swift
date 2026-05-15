import XCTest

public typealias ID = Query<XCUIElement>

public struct Query<Value> {

  private let action: (XCUIApplication) -> Value

  init(_ action: @escaping (XCUIApplication) -> Value) {
    self.action = action
  }

  func callAsFunction(_ application: XCUIApplication) -> Value {
    action(application)
  }
}

extension Query {

  func map<New>(_ transform: @escaping (Value) -> New) -> Query<New> {
    Query<New> { transform(action($0)) }
  }
}
