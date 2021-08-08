import SwiftUI

@resultBuilder
public enum InsettableShapeBuilder {
  public static func buildBlock<S: InsettableShape>(_ builder: S) -> some InsettableShape {
    builder
  }

  public static func buildOptional<S: InsettableShape>(_ component: S?) -> EitherInsettableShape<S, EmptyShape> {
    component.flatMap(EitherInsettableShape.first) ?? .second(EmptyShape())
  }

  public static func buildEither<First: InsettableShape, Second: InsettableShape>(
    first component: First
  ) -> EitherInsettableShape<First, Second> {
    .first(component)
  }

  public static func buildEither<First: InsettableShape, Second: InsettableShape>(
    second component: Second
  ) -> EitherInsettableShape<First, Second> {
    .second(component)
  }
}
