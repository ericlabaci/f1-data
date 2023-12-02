import Foundation

@testable import F1_Data

final class SeasonRacesListingViewModelInterfaceSpy: SeasonRacesListingViewModelInterface {
    private(set) var fetchSeasonRacesCalled = false
    func fetchSeasonRaces() {
        fetchSeasonRacesCalled = true
    }

    private(set) var raceExternalLinkCalled = false
    private(set) var raceExternalLinkIdPassed: String?
    var raceExternalLinkReturn: String?
    func raceExternalLink(id: String) -> String? {
        raceExternalLinkCalled = true
        raceExternalLinkIdPassed = id
        return raceExternalLinkReturn
    }

    private(set) var raceCalled = false
    private(set) var raceRowPassed: Int?
    var raceReturn: Race?
    func race(row: Int) -> Race? {
        raceCalled = true
        raceRowPassed = row
        return raceReturn
    }

    private(set) var numberOfRowsCalled = false
    private(set) var numberOfRowsReturn: Int = 0
    func numberOfRows() -> Int {
        numberOfRowsCalled = true
        return numberOfRowsReturn
    }

    private(set) var configurationCalled = false
    private(set) var configurationRowPassed: Int?
    var configurationReturn: SeasonRaceTableViewCell.Configuration?
    func configurationFor(row: Int) -> SeasonRaceTableViewCell.Configuration? {
        configurationCalled = true
        configurationRowPassed = row
        return configurationReturn
    }
}
