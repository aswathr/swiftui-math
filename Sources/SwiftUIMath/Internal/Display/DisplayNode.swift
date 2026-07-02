import CoreGraphics
import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  class DisplayNode {
    var ascent: CGFloat = 0
    var descent: CGFloat = 0
    var width: CGFloat = 0
    var position: CGPoint = .zero
    var range: NSRange = NSRange(location: 0, length: 0)
    var hasScript: Bool = false
    var textColor: CGColor?
    var localTextColor: CGColor?
    var localBackgroundColor: CGColor?

    var bounds: CGRect {
      CGRect(x: position.x, y: position.y - descent, width: width, height: ascent + descent)
    }
  }
}
