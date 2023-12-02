import Foundation
import XCTest

@testable import F1_Data

final class SeasonRacesListingViewModelTests: XCTestCase {
    private let dataStoreStub = SeasonRacesListingViewModelDataStore()
    private let seasonAPISpy = SeasonAPIInterfaceSpy()
    private let delegateSpy = SeasonRacesListingViewModelDelegateSpy()
    private lazy var sut: SeasonRacesListingViewModel = {
        let sut = SeasonRacesListingViewModel(
            dataStore: dataStoreStub,
            seasonAPI: seasonAPISpy
        )
        sut.delegate = delegateSpy
        return sut
    }()

    // MARK: - fetchSeasonRaces

    func test_fetchSeasonRaces_shouldCallGetSeasonRaces() {
        dataStoreStub.selectedSeason = "season"

        sut.fetchSeasonRaces()

        XCTAssertTrue(seasonAPISpy.getSeasonRacesCalled)
        XCTAssertEqual(seasonAPISpy.getSeasonRacesSeasonPassed, "season")
    }

    func test_fetchSeasonRaces_whenApiReturnsSuccess_shouldSetSeasonAndCallDidFetchSeasonRaces() {
        dataStoreStub.selectedSeason = "season"
        seasonAPISpy.getSeasonRacesResult = .success(.fixture(mrData: .fixture(raceTable: .fixture(season: "1"))))

        sut.fetchSeasonRaces()

        XCTAssertEqual(dataStoreStub.season?.season, "1")
        XCTAssertTrue(delegateSpy.didFetchSeasonRacesCalled)
    }
}
