import Foundation

@testable import F1_Data

final class SeasonRacesListingViewModelDelegateSpy: SeasonRacesListingViewModelDelegate, LoadingDisplayableSpy, ErrorDisplayableSpy {
    private(set) var didFetchSeasonRacesCalled = false
    func didFetchSeasonRaces() {
        didFetchSeasonRacesCalled = true
    }
}
