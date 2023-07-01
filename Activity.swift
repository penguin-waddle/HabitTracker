import SwiftUI

struct Activity: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
}
