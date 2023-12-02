import Foundation

struct RaceResult: Decodable {
    let position: String
    let points: String
    let grid: String
    let driver: Driver

    enum CodingKeys: String, CodingKey {
        case position
        case points
        case grid
        case driver = "Driver"
    }
}
