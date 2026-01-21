
import XCTest

public struct Navigation<Destination: View>: Element {
  public let id: XCUIElement
  public init(id: XCUIElement) {
    self.id = id
  }
}

extension View {

  @discardableResult
  func tap<Destination: View>(
    _ keyPath: KeyPath<Self, Navigation<Destination>>
  ) throws -> Destination {
    let navigation = self[keyPath: keyPath]
    try assertExists(navigation)
    navigation.id.tap()
    let destination = Destination()
    try destination.assertShows()
    return destination
  }
}
