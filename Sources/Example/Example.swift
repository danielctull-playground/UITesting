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


  let main = try Application(bundleIdentifier: "bundle.id")
    .launch(expecting: Main.self)

  try main.tap(\.link)

//  try main.tap(\.link) // fails if uncommented, consumed more than once.




}
