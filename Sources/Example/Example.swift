import UITesting
import XCTest

struct Main: View {

  let application: Application

  var id: Text { text }

  var text: Text {
    Text(id: application.staticTexts["Hello, world!"])
  }

  var link: Navigation<Detail> {
    Navigation(id: application.staticTexts["Hello, world!"])
  }
}

struct Detail: View  {
  let application: Application

  var id: Text { text }
  var text: Text {
    Text(id: application.staticTexts["Hello, world!"])
  }
}


@MainActor
func test() throws {


  try Application(bundleIdentifier: "bundle.id")
    .launch(expecting: Main.self)
    .tap(\.link)

}
