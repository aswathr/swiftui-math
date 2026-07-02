import CoreGraphics
import CoreText
import Foundation
import Testing

@testable import SwiftUIMath

@Suite
struct FontMetricsTests {
  private let fontName: Math.Font.Name = .latinModern

  private func makePlatformFont(size: CGFloat = 20) throws -> Math.PlatformFont {
    try #require(Math.PlatformFont(font: Math.Font(name: fontName, size: size)))
  }

  @Test
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
  func loadsGraphicsFont() throws {
    let font = try #require(Math.FontRegistry.shared.graphicsFont(named: fontName))
    #expect(font.fullName != nil)
  }

  @Test
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
  func createsPlatformFontsAtDifferentSizes() throws {
    let font12 = try makePlatformFont(size: 12)
    let font24 = try makePlatformFont(size: 24)
    #expect(CTFontGetSize(font12.ctFont) == 12)
    #expect(CTFontGetSize(font24.ctFont) == 24)
  }

  @Test
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
  func metricsHavePositiveMathUnit() throws {
    let platformFont = try makePlatformFont()
    #expect(platformFont.metrics.mathUnit > 0)
  }

  @Test
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
  func verticalVariantsUseTableEntries() throws {
    let platformFont = try makePlatformFont()
    let table = try #require(Math.FontRegistry.shared.table(named: fontName))
    let entry = try #require(table.vVariants.first { !$0.value.isEmpty })
    let glyph = platformFont.cgFont.getGlyphWithGlyphName(name: entry.key as CFString)
    #expect(glyph != 0)
    let variants = platformFont.metrics.verticalVariants(forGlyph: glyph)
    #expect(!variants.isEmpty)
  }

  @Test
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
  func horizontalVariantsUseTableEntries() throws {
    let platformFont = try makePlatformFont()
    let table = try #require(Math.FontRegistry.shared.table(named: fontName))
    let entry = try #require(table.hVariants.first { !$0.value.isEmpty })
    let glyph = platformFont.cgFont.getGlyphWithGlyphName(name: entry.key as CFString)
    #expect(glyph != 0)
    let variants = platformFont.metrics.horizontalVariants(forGlyph: glyph)
    #expect(!variants.isEmpty)
  }

  @Test
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
  func verticalAssemblyIsAvailableForExtensibleGlyphs() throws {
    let platformFont = try makePlatformFont()
    let table = try #require(Math.FontRegistry.shared.table(named: fontName))
    let entry = try #require(table.vAssembly.first)
    let glyph = platformFont.cgFont.getGlyphWithGlyphName(name: entry.key as CFString)
    #expect(glyph != 0)
    let assembly = platformFont.metrics.verticalAssembly(forGlyph: glyph)
    #expect(!assembly.isEmpty)
  }

  @Test
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
  func metricValuesAreFinite() throws {
    let platformFont = try makePlatformFont()
    let glyph = platformFont.cgFont.getGlyphWithGlyphName(name: "f" as CFString)
    #expect(glyph != 0)
    let italicCorrection = platformFont.metrics.italicCorrection(forGlyph: glyph)
    let topAccent = platformFont.metrics.topAccentAdjustment(forGlyph: glyph)
    #expect(italicCorrection.isFinite)
    #expect(topAccent.isFinite)
  }
}
