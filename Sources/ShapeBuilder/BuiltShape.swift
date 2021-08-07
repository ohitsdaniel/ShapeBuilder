import SwiftUI

public protocol BuiltShape: Shape {
  associatedtype S: Shape

  @ShapeBuilder var shape: S { get }
}

public extension BuiltShape {
  func path(in rect: CGRect) -> Path {
    shape.path(in: rect)
  }
}
