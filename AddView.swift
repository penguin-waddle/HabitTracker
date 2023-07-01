import SwiftUI

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var description = ""
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var activities: AllActivities
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save") {
                    let item = Activity(name: name, description: description)
                    activities.items.append(item)
                    dismiss()
                }
            }
        }
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: AllActivities())
    }
}
