import SwiftUI

struct ContentView: View {
    @StateObject var activity = AllActivities()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                Section (header: Text("Here are your habits:")) {
                    ForEach(activity.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.description)
                                }
                                Spacer()
                                }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddView(activities: activity)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        activity.items.remove(atOffsets: offsets)
    }
}
