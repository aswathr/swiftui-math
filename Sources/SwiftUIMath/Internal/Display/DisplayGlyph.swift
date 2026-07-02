import CoreGraphics
import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  final class DisplayGlyph: DisplayShiftedNode {
    var glyph: UInt16
    var font: Math.Font

    init(glyph: UInt16, font: Math.Font, range: NSRange) {
      self.glyph = glyph
      self.font = font
      super.init()
      self.position = .zero
      self.range = range
    }

    override var ascent: CGFloat {
      get { super.ascent - shiftDown }
      set { super.ascent = newValue }
    }

    override var descent: CGFloat {
      get { super.descent + shiftDown }
      set { super.descent = newValue }
    }
  }
}
