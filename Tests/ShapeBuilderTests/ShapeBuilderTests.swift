@testable import ShapeBuilder
import SnapshotTesting
import SwiftUI
import XCTest

struct ConditionalTestShape: BuiltShape {
  let condition: Bool

  var shape: some Shape {
    if condition {
      Circle()
    } else {
      Rectangle()
    }
  }
}

struct OptionalTestShape: BuiltShape {
  let value: Int?

  var shape: some Shape {
    if let _ = value {
      Circle()
    }
  }
}

final class ShapeBuilderTests: XCTestCase {
  // snapshots recorded on iPhone 12, iOS 14.5
  func test_conditional_true() {
    let sut = ConditionalTestShape(condition: true)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_conditional_false() {
    let sut = ConditionalTestShape(condition: false)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_optional_exists() {
    let sut = OptionalTestShape(value: 1)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_optional_nil() {
    let sut = OptionalTestShape(value: nil)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }
}
