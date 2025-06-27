import Foundation

struct CardItem: Codable, Identifiable {
    var id = UUID()  
    var term: String
    var definition: String
}
