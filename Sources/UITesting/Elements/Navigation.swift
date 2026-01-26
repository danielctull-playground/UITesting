import XCTest

public struct Navigation<Destination: View>: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}

extension State {

  @discardableResult
  public consuming func tap<Destination: View>(
    _ keyPath: KeyPath<Content, Navigation<Destination>>
  ) throws -> State<Destination> {
    let navigation = content[keyPath: keyPath]
    let state = try expect(exists: keyPath)
    navigation.id.tap()
    let destination = State<Destination>(
      content: Destination(application: state.content.application)
    )
    return try destination.shows()
  }
}
