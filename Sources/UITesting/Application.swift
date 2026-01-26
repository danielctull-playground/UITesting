import XCTest

@MainActor
@dynamicMemberLookup
public struct Application {

  private let rawValue: XCUIApplication

  public init() {
    rawValue = XCUIApplication()
  }

  public init(bundleIdentifier: String) {
    rawValue = XCUIApplication(bundleIdentifier: bundleIdentifier)
  }

  public subscript<Value>(
    dynamicMember keyPath: KeyPath<XCUIApplication, Value>
  ) -> Value {
    rawValue[keyPath: keyPath]
  }

  public func launch<Content: View>(
    expecting: Content.Type
  ) throws -> State<Content> {
    rawValue.launch()
    return try State(application: self, content: Content())
      .shows()
  }
}

extension Application {
  static let springboard = Application(bundleIdentifier: "com.apple.springboard")
}
