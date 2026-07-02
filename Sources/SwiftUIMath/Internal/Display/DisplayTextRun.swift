import CoreGraphics
import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  final class DisplayTextRun: DisplayNode {
    var attributedString: NSAttributedString
    var font: Math.Font
    var atoms: [Math.Atom]
    var text: String { attributedString.string }

    init(
      attributedString: NSAttributedString,
      font: Math.Font,
      position: CGPoint = .zero,
      range: NSRange,
      atoms: [Math.Atom]
    ) {
      self.attributedString = attributedString
      self.font = font
      self.atoms = atoms
      super.init()
      self.position = position
      self.range = range
    }
  }
}
