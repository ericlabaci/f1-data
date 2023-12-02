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

extension SeasonInfo.MRData.RaceTable {
    struct Race: Decodable {
        let round: String
        let raceName: String
        let date: String
        let time: String
        let url: String
        let circuit: Circuit

        enum CodingKeys: String, CodingKey {
            case round
            case raceName
            case date
            case time
            case url
            case circuit = "Circuit"
        }
    }

    struct Circuit: Decodable {
        let url: String
        let circuitName: String
    }
}
