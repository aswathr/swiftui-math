import SwiftUI

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Math {
  /// Controls how math is typeset (display vs inline text).
  public enum TypesettingStyle: Sendable {
    /// Display style for standalone equations.
    case display
    /// Text style for inline math.
    case text
  }
}

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension View {
  /// Sets the typesetting style for ``Math`` views in this hierarchy.
  public func mathTypesettingStyle(_ typesettingStyle: Math.TypesettingStyle) -> some View {
    environment(\.mathTypesettingStyle, typesettingStyle)
  }
}

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension EnvironmentValues {
  @Entry var mathTypesettingStyle: Math.TypesettingStyle = .display
}
