import SwiftUI

/// Helper struct for organizing tabs with their group
struct TabGroupWithTabs: Identifiable {
    let id: UUID
    let group: TabGroup?
    let tabs: [Tab]

    init(group: TabGroup?, tabs: [Tab]) {
        self.id = group?.id ?? UUID()
        self.group = group
        self.tabs = tabs
    }
}

/// Represents a group of tabs (similar to Chrome Tab Groups)
struct TabGroup: Identifiable, Codable {
    let id: UUID
    var name: String
    var color: TabGroupColor
    var isCollapsed: Bool
    var createdAt: Date

    init(
        id: UUID = UUID(),
        name: String = "",
        color: TabGroupColor = .gray,
        isCollapsed: Bool = false,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.color = color
        self.isCollapsed = isCollapsed
        self.createdAt = createdAt
    }
}

/// Available colors for tab groups (9 colors)
enum TabGroupColor: String, Codable, CaseIterable {
    case gray
    case blue
    case red
    case yellow
    case green
    case pink
    case purple
    case cyan
    case orange

    var swiftUIColor: Color {
        // Same hue as the system color, with reduced saturation and raised
        // brightness — soft pastel tones that read as tints on the toolbar.
        Color(nsColor: nsColor)
    }

    var nsColor: NSColor {
        // Soft pastel palette: hue unchanged, saturation lowered, brightness
        // raised. Both the group editor swatches and every group surface
        // (dot, header fill, border cap, sidebar indicators) derive from this
        // one table so the color reads consistently everywhere.
        switch self {
        case .gray:   return NSColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1.0)
        case .blue:   return NSColor(red: 0.55, green: 0.68, blue: 1.00, alpha: 1.0)
        case .red:    return NSColor(red: 1.00, green: 0.65, blue: 0.65, alpha: 1.0)
        case .yellow: return NSColor(red: 1.00, green: 0.88, blue: 0.55, alpha: 1.0)
        case .green:  return NSColor(red: 0.65, green: 0.92, blue: 0.65, alpha: 1.0)
        case .pink:   return NSColor(red: 1.00, green: 0.72, blue: 0.87, alpha: 1.0)
        case .purple: return NSColor(red: 0.78, green: 0.65, blue: 0.95, alpha: 1.0)
        case .cyan:   return NSColor(red: 0.55, green: 0.90, blue: 0.92, alpha: 1.0)
        case .orange: return NSColor(red: 1.00, green: 0.78, blue: 0.60, alpha: 1.0)
        }
    }

    var displayName: String {
        switch self {
        case .gray:   return "Gray"
        case .blue:   return "Blue"
        case .red:    return "Red"
        case .yellow: return "Yellow"
        case .green:  return "Green"
        case .pink:   return "Pink"
        case .purple: return "Purple"
        case .cyan:   return "Cyan"
        case .orange: return "Orange"
        }
    }
}
