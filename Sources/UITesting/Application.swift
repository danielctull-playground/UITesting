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

  public func launch<Content: View>(
    expecting: Content.Type
  ) throws -> State<Content> {
    id.launch()
    return try State(content: Content(application: self)).shows()
  }
}

extension Application {
  static let springboard = Application(bundleIdentifier: "com.apple.springboard")
}
