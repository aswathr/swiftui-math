import CoreGraphics
import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  final class DisplayLine: DisplayNode {
    var inner: DisplayList?
    var lineShiftUp: CGFloat = 0
    var lineThickness: CGFloat = 0

    init(inner: DisplayList?, position: CGPoint, range: NSRange) {
      self.inner = inner
      super.init()
      self.position = position
      self.range = range
    }

    override var position: CGPoint {
      didSet { updateInnerPosition() }
    }

    private func updateInnerPosition() {
      inner?.position = CGPoint(x: position.x, y: position.y)
    }
  }
}
