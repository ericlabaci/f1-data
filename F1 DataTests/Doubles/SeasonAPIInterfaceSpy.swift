import Foundation

@testable import F1_Data

final class SeasonAPIInterfaceSpy: SeasonAPIInterface {
    private(set) var getSeasonRacesCalled = false
    private(set) var getSeasonRacesSeasonPassed: String?
    var getSeasonRacesResult: Result<SeasonInfo, Error>?
    func getSeasonRaces(season: String, completion: @escaping (Result<SeasonInfo, Error>) -> Void) {
        getSeasonRacesCalled = true
        getSeasonRacesSeasonPassed = season
        guard let getSeasonRacesResult else { return }
        completion(getSeasonRacesResult)
    }

    private(set) var getRaceResultsCalled = false
    private(set) var getRaceResultsParamsPassed: (season: String, round: String)?
    var getRaceResultsResult: Result<SeasonInfo, Error>?
    func getRaceResults(season: String, round: String, completion: @escaping (Result<SeasonInfo, Error>) -> Void) {
        getRaceResultsCalled = true
        getRaceResultsParamsPassed = (season, round)
        guard let getRaceResultsResult else { return }
        completion(getRaceResultsResult)
    }
}
