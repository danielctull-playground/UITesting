import XCTest

public struct Navigation<Destination: View>: Element {
  public let id: (Application) -> XCUIElement
  public init(id: @escaping (Application) -> XCUIElement) {
    self.id = id
  }
}

extension State {

  @discardableResult
  public consuming func tap<Destination: View>(
    _ keyPath: KeyPath<Content, Navigation<Destination>>
  ) throws -> State<Destination> {
    let navigation = try expect(exists: keyPath)
    navigation.id(application).tap()
    let destination = State<Destination>(
      application: application,
      content: Destination()
    )
    return try destination.shows()
  }
}
