import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  final class Space: Atom {
    var amount: CGFloat

    init(_ space: Space) {
      self.amount = space.amount
      super.init(space)
    }

    init(amount: CGFloat = 0) {
      self.amount = amount
      super.init(type: .space)
    }
  }
}
