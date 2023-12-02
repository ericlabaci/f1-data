import Foundation

struct Race: Decodable {
    let round: String
    let raceName: String
    let date: String
    let time: String
    let url: String
    let circuit: Circuit
    let season: String
    let results: [RaceResult]?

    var id: String {
        return season + round
    }

    enum CodingKeys: String, CodingKey {
        case round
        case raceName
        case date
        case time
        case url
        case circuit = "Circuit"
        case season
        case results = "Results"
    }
}
