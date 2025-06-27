import Foundation

struct FlashCardItem: Codable, Identifiable {
    let id: String
    let title: String
    var term: String
    var definition: String
}
