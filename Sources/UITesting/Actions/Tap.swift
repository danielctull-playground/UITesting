
extension State {

  @discardableResult
  public consuming func tap<E: Element>(
    _ keyPath: KeyPath<Content, E>
  ) throws -> Self where E.Destination == Never {
    let button = try element(at: keyPath)
    button.id(application).tap()
    return self
  }

  @discardableResult
  public consuming func tap<E: Element>(
    _ keyPath: KeyPath<Content, E>
  ) throws -> State<E.Destination> {
    let button = try element(at: keyPath)
    button.id(application).tap()

    let destination = State<E.Destination>(
      application: application,
      content: E.Destination()
    )

    return try destination.shows()
  }
}
