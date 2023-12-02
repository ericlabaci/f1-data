import Foundation

@testable import F1_Data

final class SeasonRacesListingRouterInterfaceSpy: SeasonRacesListingRouterInterface {
    private(set) var openRaceResultsCalled = false
    private(set) var openRaceResultsParamsPassed: (season: String, round: String)?
    func openRaceResults(season: String, round: String) {
        openRaceResultsCalled = true
        openRaceResultsParamsPassed = (season, round)
    }

    private(set) var openExternalLinkCalled = false
    private(set) var openExternalLinkUrlPassed: String?
    func openExternalLink(url: String) {
        openExternalLinkCalled = true
        openExternalLinkUrlPassed = url
    }
}
