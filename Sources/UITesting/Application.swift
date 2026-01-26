import XCTest

@MainActor
@dynamicMemberLookup
public struct Application {

  private let id: XCUIApplication

  public init() {
    id = XCUIApplication()
  }

  public init(bundleIdentifier: String) {
    id = XCUIApplication(bundleIdentifier: bundleIdentifier)
  }

  public subscript<Value>(
    dynamicMember keyPath: KeyPath<XCUIApplication, Value>
  ) -> Value {
    id[keyPath: keyPath]
  }

  public func launch<V: View>(expecting: V.Type) throws -> State<V> {
    id.launch()
    let view = V(application: self)
    try view.assertShows()
    return State(value: view)
  }
}

extension Application {
  static let springboard = Application(bundleIdentifier: "com.apple.springboard")
}

