import XCTest

public struct Navigation<Destination: View>: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}

extension State where Value: View {

  @discardableResult
  public consuming func tap<Destination: View>(
    _ keyPath: KeyPath<Value, Navigation<Destination>>
  ) throws -> State<Destination> {
    let navigation = value[keyPath: keyPath]
    let state = try expect(navigation)
    navigation.id.tap()
    let destination = Destination(application: state.value.application)
    try destination.assertShows()
    return State<Destination>(value: destination)
  }
}
