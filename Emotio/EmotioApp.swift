import SwiftUI
import SwiftData

@main
struct Emotio2App: App {
    @AppStorage("selectedTheme") private var theme: ThemeOption = .system
    @AppStorage("selectedAccentColor") private var accent: AccentColorOption = .orange

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WelcomeView()
            }
            .preferredColorScheme(theme == .system ? nil : theme == .light ? .light : .dark)
            .tint(accent.color)
        }
        .modelContainer(for: MoodEntry.self)
    }
}
