import SwiftUI

enum ThemeOption: String, CaseIterable, Identifiable {
    case system = "System Default"
    case light = "Light Mode"
    case dark = "Dark Mode"
    var id: String { self.rawValue }
}

enum AccentColorOption: String, CaseIterable, Identifiable {
    case red, orange, yellow, green, teal, cyan, blue, indigo, purple, pink, mint, brown
    var id: String { self.rawValue }
    var color: Color {
        switch self {
        case .red: return .red
        case .orange: return .orange
        case .yellow: return .yellow
        case .green: return .green
        case .teal: return .teal
        case .cyan: return .cyan
        case .blue: return .blue
        case .indigo: return .indigo
        case .purple: return .purple
        case .pink: return .pink
        case .mint: return .mint
        case .brown: return .brown
        }
    }
}

struct SettingsView: View {
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true
    @AppStorage("hapticFeedbackEnabled") private var hapticFeedbackEnabled = true
    @AppStorage("selectedTheme") private var selectedTheme: ThemeOption = .system
    @AppStorage("selectedAccentColor") private var selectedAccentColor: AccentColorOption = .orange

    var body: some View {
        Form {
            Section(header: Text("Preferences")) {
                Toggle("Notifications", isOn: $notificationsEnabled)
                Toggle("Haptic Feedback", isOn: $hapticFeedbackEnabled)
            }

            Section(header: Text("Appearance")) {
                HStack {
                    Text("Appearance")

                    Spacer()

                    HStack(spacing: 15) {
                        ForEach(ThemeOption.allCases, id: \.self) { theme in
                            Circle()
                                .fill(selectedTheme == theme ? selectedAccentColor.color : Color.gray.opacity(0.3))
                                .frame(width: 35, height: 35)
                                .overlay(
                                    Text(theme == .system ? "⚙️" : theme == .light ? "☀️" : "🌙")
                                        .font(.caption)
                                        .foregroundColor(selectedTheme == theme ? .white : .primary)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        selectedTheme = theme
                                    }
                                }
                        }
                    }
                }
                .padding(.vertical, 5)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 10) {
                    ForEach(AccentColorOption.allCases) { accentColor in
                        AccentColorCircle(
                            accentColor: accentColor,
                            isSelected: selectedAccentColor == accentColor
                        ) {
                            withAnimation {
                                selectedAccentColor = accentColor
                            }
                        }
                    }
                }
                .padding(.vertical)
            }

            Section(header: Text("About")) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Emotio is a simple mood-tracking app that helps you reflect on how you're feeling throughout the day.")
                        .font(.subheadline)

                    Text("Made for:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("CS 198-075/750: Introduction to Building Apps\nUC Berkeley | Spring 2025")
                        .font(.subheadline)

                    Text("Created by Arnav Podichetty")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("Settings")
    }
}

struct AccentColorCircle: View {
    let accentColor: AccentColorOption
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Circle()
            .fill(accentColor.color)
            .frame(width: 30, height: 30)
            .overlay(
                Circle()
                    .stroke(isSelected ? Color.primary : Color.clear, lineWidth: 2)
            )
            .onTapGesture {
                onTap()
            }
    }
}
