import Foundation

// MARK: - People
struct People: Codable {
    let name, height, mass: String
    let gender: String
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String
}
