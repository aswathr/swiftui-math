import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  final class LargeOperator: Atom {
    var limits: Bool

    init(_ largeOperator: LargeOperator) {
      self.limits = largeOperator.limits
      super.init(largeOperator)
    }

    init(limits: Bool = false) {
      self.limits = limits
      super.init(type: .largeOperator)
    }
  }
}
