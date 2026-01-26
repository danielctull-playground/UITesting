import UITesting
import XCTest

struct Main: View {

  var id: Text { text }

  let text = Text { $0.staticTexts["Hello, world!"] }

  let field = TextField { $0.staticTexts["Hello, world!"] }

  let link = Navigation<Detail> { $0.staticTexts["Hello, world!"] }
}

struct Detail: View  {

  var id: Text { text }

  let text = Text { $0.staticTexts["Hello, world!"] }
}

@MainActor
func test() throws {


  let main = try Application(bundleIdentifier: "bundle.id")
    .launch(expecting: Main.self)
    .type(\.field, "hello!")
    .expect(\.text.label, is: "label")

  try main.tap(\.link)

//  try main.tap(\.link) // fails if uncommented, consumed more than once.




}
