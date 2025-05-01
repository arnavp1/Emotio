import SwiftUI

struct MainView: View {
    @AppStorage("selectedTheme") private var selectedTheme: ThemeOption = .system
    @AppStorage("selectedAccentColor") private var selectedAccentColor: AccentColorOption = .orange
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore = false
    @AppStorage("lastLoggedMood") private var lastLoggedMood: String = ""
    @State private var motivationalMessage: String? = nil
    @State private var motivationalMood: MoodType? = nil
    @State private var moodOfTheDay: String? = nil
    @State private var animationPhase: Double = 0
    @State private var timer = Timer.publish(every: 0.016, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack(spacing: 40) {
                if let mood = moodOfTheDay {
                    VStack(spacing: 4) {
                        Text(mood)
                            .font(.system(size: 100))
                            .offset(x: CGFloat(sin(animationPhase)) * 4,
                                    y: CGFloat(cos(animationPhase)) * 4)
                    }
                }

                if let mood = motivationalMood {
                    Text(mood.motivationalText)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(mood.moodColor)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                } else {
                    Text("How are you feeling today?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                VStack(spacing: 16) {
                    NavigationLink {
                        LogMoodView()
                    } label: {
                        Label("Log Mood", systemImage: "pencil.circle.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedAccentColor.color)
                            .cornerRadius(10)
                    }

                    NavigationLink {
                        HistoryView()
                    } label: {
                        Label("View History", systemImage: "clock.fill")
                            .font(.headline)
                            .foregroundColor(selectedAccentColor.color)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.secondarySystemBackground))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedAccentColor.color, lineWidth: 2)
                            )
                    }

                    NavigationLink {
                        SettingsView()
                    } label: {
                        Label("Settings", systemImage: "gearshape.fill")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.secondarySystemBackground))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Emotio")
            .navigationBarBackButtonHidden(true)
            .padding()
        }
        .onAppear {
            if let savedDate = UserDefaults.standard.object(forKey: "moodOfTheDayDate") as? Date,
               Calendar.current.isDateInToday(savedDate),
               let emoji = UserDefaults.standard.string(forKey: "moodOfTheDay") {
                moodOfTheDay = emoji
                lastLoggedMood = emoji
            } else {
                moodOfTheDay = "🧠"
            }

            if !hasLaunchedBefore {
                motivationalMood = nil
                hasLaunchedBefore = true
            } else {
                if let mood = MoodType(rawValue: lastLoggedMood) {
                    motivationalMood = mood
                }
            }
        }

        .onReceive(timer) { _ in
            animationPhase += 0.05
        }
        .preferredColorScheme(
            selectedTheme == .system ? nil :
            selectedTheme == .light ? .light : .dark
        )
        .tint(selectedAccentColor.color)
    }
}
