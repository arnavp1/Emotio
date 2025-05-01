import SwiftUI
import SwiftData

struct LogMoodView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    let columns = [GridItem(.adaptive(minimum: 80), spacing: 20)]

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Select Your Mood")
                    .font(.title2)
                    .fontWeight(.semibold)

                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(MoodType.allCases) { mood in
                        Button {
                            let entry = MoodEntry(mood: mood)
                            modelContext.insert(entry)
                            try? modelContext.save()
                            UserDefaults.standard.set(mood.rawValue, forKey: "moodOfTheDay")
                            UserDefaults.standard.set(Date(), forKey: "moodOfTheDayDate")
                            dismiss()
                        }
                        label: {
                            Text(mood.rawValue)
                                .font(.system(size: 50))
                                .frame(width: 80, height: 80)
                                .background(
                                    Circle()
                                        .fill(Color(.secondarySystemBackground))
                                )
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        }
                    }
                }
                .padding()

                Spacer()
            }
            .padding(.top)
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .bottom)
        .navigationTitle("Log Mood")
    }
}
