import UITesting
import XCTest

struct Main: View {
  var id: some Element { title }
  let title = Text(id: \.staticTexts["main-title"])
  let username = TextField(id: \.textFields["username"])
  let password = SecureTextField(id: \.secureTextFields["password"])
  let login = Navigation<Detail>(id: \.buttons["login"])
}

struct Detail: View  {
  var id: some Element { title }
  let title = Text(id: \.staticTexts["detail-title"])
}

@MainActor
func test() throws {

  try Application(bundleIdentifier: "bundle.id")
    .launch(expecting: Main.self)
    .activity("Login") {
      try $0
        .type("daniel", in: \.username)
        .type("secret", in: \.password)
        .tap(\.login)
    }
    .expect(\.title.value, is: "hello, daniel")
}
