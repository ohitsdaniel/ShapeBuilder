import SwiftUI

@resultBuilder
public enum ShapeBuilder {
  public static func buildBlock<S: Shape>(_ builder: S) -> some Shape {
    builder
  }

  public static func buildOptional<S: Shape>(_ component: S?) -> EitherShape<S, EmptyShape> {
    component.flatMap(EitherShape.first) ?? EitherShape.second(EmptyShape())
  }

  public static func buildEither<First: Shape, Second: Shape>(first component: First) -> EitherShape<First, Second> {
    .first(component)
  }

  public static func buildEither<First: Shape, Second: Shape>(second component: Second) -> EitherShape<First, Second> {
    .second(component)
  }
}
