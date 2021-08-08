@testable import ShapeBuilder
import SnapshotTesting
import SwiftUI
import XCTest

struct ConditionalTestInsettableShape: BuiltInsettableShape {
  let condition: Bool

  var shape: some InsettableShape {
    if condition {
      Circle()
    } else {
      Rectangle()
    }
  }
}

struct OptionalTestInsettableShape: BuiltInsettableShape {
  let value: Int?

  var shape: some InsettableShape {
    if let _ = value {
      Circle()
    }
  }
}

final class InsettableShapeBuilderTests: XCTestCase {
  // snapshots recorded on iPhone 12, iOS 14.5
  func test_conditional_true() {
    let sut = ConditionalTestInsettableShape(condition: true)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_conditional_false() {
    let sut = ConditionalTestInsettableShape(condition: false)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_optional_exists() {
    let sut = OptionalTestInsettableShape(value: 1)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_optional_nil() {
    let sut = OptionalTestInsettableShape(value: nil)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  // MARK: - inset(by:)
  func test_conditional_true_inset_by() {
    let sut = ConditionalTestInsettableShape(condition: true)
      .inset(by: 5)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_conditional_false_inset_by() {
    let sut = ConditionalTestInsettableShape(condition: false)
      .inset(by: 5)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_optional_exists_inset_by() {
    let sut = OptionalTestInsettableShape(value: 1)
      .inset(by: 5)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }

  func test_optional_nil_inset_by() {
    let sut = OptionalTestInsettableShape(value: nil)
      .inset(by: 5)
      .frame(width: 30, height: 30)

    assertSnapshot(matching: sut, as: .image)
  }
}
