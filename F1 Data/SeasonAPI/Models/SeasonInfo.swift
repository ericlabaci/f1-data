import Foundation

struct SeasonInfo: Decodable {
    let mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

extension SeasonInfo {
    struct MRData: Decodable {
        let raceTable: RaceTable

        enum CodingKeys: String, CodingKey {
            case raceTable = "RaceTable"
        }
    }
}

extension SeasonInfo.MRData {
    struct RaceTable: Decodable {
        let season: String
        let races: [Race]

        enum CodingKeys: String, CodingKey {
            case season
            case races = "Races"
        }
    }
}
