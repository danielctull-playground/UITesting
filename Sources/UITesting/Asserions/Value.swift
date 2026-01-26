import XCTest

extension State {

  @discardableResult
  public consuming func expect<Value: Equatable>(
    _ keyPath: KeyPath<Content, Lookup<Value>>,
    is expected: Value
  ) throws -> Self {
    let lookup = content[keyPath: keyPath]
    let value = lookup(application)
    guard value == expected else {
      throw IncorrectValue(value: value, expected: expected)
    }
    return self
  }
}

// MARK: IncorrectValue

@MainActor
struct IncorrectValue<Value>: Error {
  fileprivate let value: Value
  fileprivate let expected: Value
}

extension IncorrectValue: @MainActor CustomStringConvertible {
  var description: String {
    "Value is incorrect. Was \(value) expected: \(expected)"
  }
}
