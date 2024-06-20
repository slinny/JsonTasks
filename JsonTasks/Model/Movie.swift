import Foundation

// MARK: - MovieElement
struct Movie: Codable {
    let duration: Double
    let plays: Int
    let size: Int
    let title: String
    let progress: Int
    let tags: [String]
    let id: String
    let state: String
}
