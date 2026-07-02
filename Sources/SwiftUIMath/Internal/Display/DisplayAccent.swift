import CoreGraphics
import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  final class DisplayAccent: DisplayNode {
    var accentee: DisplayList?
    var accent: DisplayGlyph?

    init(accent: DisplayGlyph?, accentee: DisplayList?, range: NSRange) {
      self.accent = accent
      self.accentee = accentee
      super.init()
      self.range = range
    }

    override var position: CGPoint {
      didSet { updateAccenteePosition() }
    }

    private func updateAccenteePosition() {
      accentee?.position = CGPoint(x: position.x, y: position.y)
    }
  }
}
