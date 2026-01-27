import UITesting
import XCTest

struct Main: View {
  var id: Text { title }
  let title = Text(id: \.staticTexts["main-title"])
  let username = TextField(id: \.textFields["username"])
  let password = TextField(id: \.secureTextFields["password"])
  let login = Navigation<Detail>(id: \.buttons["login"])
}

struct Detail: View  {
  var id: Text { title }
  let title = Text(id: \.staticTexts["detail-title"])
}

@MainActor
func test() throws {

  try Application(bundleIdentifier: "bundle.id")
    .launch(expecting: Main.self)
    .type("daniel", in: \.username)
    .type("secret", in: \.password)
    .expect(\.login.label, is: "label")
    .tap(\.login)
}
