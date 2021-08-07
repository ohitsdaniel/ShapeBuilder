import SwiftUI

public enum EitherShape<First: Shape, Second: Shape>: Shape {
  case first(First)
  case second(Second)

  public func path(in rect: CGRect) -> Path {
    switch self {
    case let .first(first):
      return first.path(in: rect)
    case let .second(second):
      return second.path(in: rect)
    }
  }
}
