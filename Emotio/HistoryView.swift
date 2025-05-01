import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var moods: [MoodEntry] = []

    var body: some View {
        Group {
            if moods.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "tray")
                        .font(.system(size: 48))
                        .foregroundColor(.secondary)
                    Text("No moods logged yet")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemGroupedBackground))
            } else {
                List {
                    ForEach(moods) { entry in
                        HStack(spacing: 16) {
                            ZStack {
                                Circle()
                                    .fill(Color(.secondarySystemBackground))
                                    .frame(width: 60, height: 60)
                                    .shadow(radius: 3)
                                Text(entry.mood.rawValue)
                                    .font(.system(size: 32))
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                Text(entry.date, format: .dateTime.year().month().day())
                                    .font(.headline)
                                Text(entry.date, format: .dateTime.hour().minute())
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Button {
                                deleteMood(entry)
                            } label: {
                                Image(systemName: "trash.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.secondarySystemBackground))
                                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                        )
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
                .padding(.top, 8)
                .background(Color(.systemGroupedBackground).ignoresSafeArea())
            }
        }
        .navigationTitle("History")
        .task { await loadMoods() }
    }

    private func loadMoods() async {
        let descriptor = FetchDescriptor<MoodEntry>(
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        let fetched = try? modelContext.fetch(descriptor)
        await MainActor.run { moods = fetched ?? [] }
    }

    private func deleteMood(_ entry: MoodEntry) {
        withAnimation {
            modelContext.delete(entry)
            try? modelContext.save()
            moods.removeAll { $0.id == entry.id }
        }
    }
}
