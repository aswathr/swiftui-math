import CoreGraphics
import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension CGColor {
  static func fromHexString(_ hexString: String) -> CGColor? {
    guard !hexString.isEmpty, hexString.hasPrefix("#") else { return nil }

    var rgbValue = UInt64(0)
    let scanner = Scanner(string: hexString)
    scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
    guard scanner.scanHexInt64(&rgbValue) else { return nil }

    return CGColor(
      srgbRed: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: 1.0
    )
  }
}
