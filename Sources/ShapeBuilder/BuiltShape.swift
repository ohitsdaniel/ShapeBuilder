import SwiftUI

/// A convenience protocol wrapping a `@ShapeBuilder`
///
/// Shares similarities with SwiftUI's `View` protocol. Defines a get-only `shape` computed property which is marked with `@ShapeBuilder`.
///
/// **Example**
/// ```swift
/// struct MyFancyMask: BuiltShape {
///   let isCircle: Bool
///
///   var shape: some Shape {
///     if isCircle {
///       Circle()
///     } else {
///       RoundedRectangle(cornerRadius: 10)
///     }
///   }
/// }
/// ```
public protocol BuiltShape: Shape {
  associatedtype S: Shape

  @ShapeBuilder var shape: S { get }
}

public extension BuiltShape {
  func path(in rect: CGRect) -> Path {
    shape.path(in: rect)
  }
}

/// A convenience protocol wrapping a `@InsettableShapeBuilder`
///
/// Shares similarities with SwiftUI's `View` protocol. Defines a get-only `shape` computed property which is marked with `@InsettableShapeBuilder`.
///
/// **Example**
/// ```swift
/// struct MyFancyMask: BuiltInsettableShape {
///   let isCircle: Bool
///
///   var shape: some InsettableShape {
///     if isCircle {
///       Circle()
///     } else {
///       RoundedRectangle(cornerRadius: 10)
///     }
///   }
/// }
/// ```
public protocol BuiltInsettableShape: InsettableShape {
  associatedtype S: InsettableShape

  @InsettableShapeBuilder var shape: S { get }
}

public extension BuiltInsettableShape {
  func path(in rect: CGRect) -> Path {
    shape.path(in: rect)
  }

  func inset(by amount: CGFloat) -> S.InsetShape {
    shape.inset(by: amount)
  }
}
