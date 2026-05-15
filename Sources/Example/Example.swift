import UITesting
import XCTest

struct Main: Screen {
  var id: Query<XCUIElement> { title.id }
  let title = Text("main-title")
  let username = TextField("username")
  let password = SecureTextField("password")
  let agreement = Checkbox("agreement")
  let login = Navigation<Detail>(id: \.buttons["login"])
}

struct Detail: Screen  {
  var id: Query<XCUIElement> { title.id }
  let title = Text("detail-title")
}

@MainActor
func test() throws {

  try XCUIApplication(bundleIdentifier: "bundle.id")
    .launch(expecting: Main.self)
    .activity("Login") {
      try $0
        .type("daniel", in: \.username)
        .type("secret", in: \.password)
        .toggle(\.agreement)
        .tap(\.login)
    }
    .expect(\.title.value, is: "hello, daniel")
}
