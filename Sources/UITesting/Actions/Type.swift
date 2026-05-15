
extension State {

  @discardableResult
  public consuming func type(
    _ text: String,
    in keyPath: KeyPath<Content, TextField>
  ) throws -> Self {
    let textField = try element(at: keyPath)
    textField.id(application).typeText(text)
    return self
  }

  @discardableResult
  public consuming func type(
    _ text: String,
    in keyPath: KeyPath<Content, SecureTextField>
  ) throws -> Self {
    let textField = try element(at: keyPath)
    textField.id(application).typeText(text)
    return self
  }
}
