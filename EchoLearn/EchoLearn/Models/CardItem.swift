import Foundation

struct FlashCardItem: Codable, Identifiable {
    let id: String
    let title: String
    let term: String
    let definition: String
}
