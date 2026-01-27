import UITesting
import XCTest

struct Main: View {
  var id: Text { title }
  let title = Text(element: \.staticTexts["main-title"])
  let username = TextField(element: \.textFields["username"])
  let password = TextField(element: \.secureTextFields["password"])
  let login = Navigation<Detail>(element: \.buttons["login"])
}

struct Detail: View  {
  var id: Text { title }
  let title = Text(element: \.staticTexts["detail-title"])
}

@MainActor
func test() throws {

  try Application(bundleIdentifier: "bundle.id")
    .launch(expecting: Main.self)
    .type(\.username, "daniel")
    .type(\.password, "secret")
    .expect(\.login.label, is: "label")
    .tap(\.login)
}
