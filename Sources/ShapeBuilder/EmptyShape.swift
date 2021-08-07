import SwiftUI

public struct EmptyShape: Shape {
  public init() {}

  public func path(in rect: CGRect) -> Path {
    Path()
  }
}
