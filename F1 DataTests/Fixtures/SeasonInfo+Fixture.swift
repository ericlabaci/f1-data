import Foundation

@testable import F1_Data

extension SeasonInfo {
    static func fixture(mrData: SeasonInfo.MRData = .fixture()) -> SeasonInfo {
        return SeasonInfo(mrData: mrData)
    }
}

extension SeasonInfo.MRData {
    static func fixture(raceTable: SeasonInfo.MRData.RaceTable = .fixture()) -> SeasonInfo.MRData {
        return SeasonInfo.MRData(raceTable: raceTable)
    }
}

extension SeasonInfo.MRData.RaceTable {
    static func fixture(
        season: String = "",
        races: [Race] = []
    ) -> SeasonInfo.MRData.RaceTable {
        return SeasonInfo.MRData.RaceTable(
            season: season,
            races: races
        )
    }
}
