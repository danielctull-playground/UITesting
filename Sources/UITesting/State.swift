
@MainActor
public struct State<Content: View>: ~Copyable {
  let application: Application
  let content: Content
}
