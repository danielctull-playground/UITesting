import UITesting
import XCTest

struct Main: Screen {
  var id: ID { title.id }
  let title = Text("main-title")
  let username = TextField("username")
  let password = SecureTextField("password")
  let agreement = Checkbox("agreement")
  let login = Button("login", destination: Detail.self)
}

struct Detail: Screen  {
  var id: ID { message.id }
  let message = Text("detail-title")
  let back = Button("back", destination: Previous.self)
}

@MainActor
func test() throws {

  try XCUIApplication(bundleIdentifier: "bundle.id")
    .launch(expecting: Main.self)
    .activity("Login") {
      try $0
        .type("daniel", in: \.username)
        .type("secret", in: \.password)
        .tap(\.agreement)
        .tap(\.login)
    }
    .expect(\.message.value, is: "hello, daniel")
    .tap(\.back)
    .activity("Login") {
      try $0
        .type("daniel", in: \.username)
        .type("secret", in: \.password)
        .tap(\.agreement)
        .tap(\.login)
    }
    .expect(\.message.value, is: "hello, daniel")
}
