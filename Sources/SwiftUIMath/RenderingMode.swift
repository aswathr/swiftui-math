import SwiftUI

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  /// Controls how colors are applied when rendering math.
  public enum RenderingMode: Sendable {
    /// Draws all glyphs using the view's foreground style.
    case monochrome
    /// Honors LaTeX color commands and uses the base color for uncolored glyphs.
    case multicolor(base: SwiftUI.Color)

    /// Multicolor rendering using the view's primary color as the base.
    public static var multicolor: Self {
      .multicolor(base: .primary)
    }
  }
}

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {
  /// Sets the rendering mode for ``Math`` views in this hierarchy.
  public func mathRenderingMode(_ mathRenderingMode: Math.RenderingMode) -> some View {
    environment(\.mathRenderingMode, mathRenderingMode)
  }
}

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EnvironmentValues {
  @Entry var mathRenderingMode: Math.RenderingMode = .monochrome
}
