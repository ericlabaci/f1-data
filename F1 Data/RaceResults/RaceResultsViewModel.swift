import Foundation

protocol RaceResultsViewModelDelegate: AnyObject, LoadingDelegate {
    func didFetchResults()
}

protocol RaceResultsViewModelInterface: AnyObject {
    var navigationTitle: String { get }

    func fetchResults()
    func numberOfRows() -> Int
    func configurationFor(row: Int) -> RaceResultsTableViewCell.Configuration?
}

final class RaceResultsViewModelDataStore {
    let season: String
    let round: String
    var race: SeasonInfo.MRData.RaceTable.Race?

    init(season: String, round: String) {
        self.season = season
        self.round = round
    }
}

final class RaceResultsViewModel: RaceResultsViewModelInterface {
    private let dataStore: RaceResultsViewModelDataStore
    private let seasonAPI: SeasonAPIInterface

    var navigationTitle: String {
        guard let race = dataStore.race else {
            return ""
        }
        return RaceResultsStrings.Navigation.title(race.raceName, race.season)
    }

    weak var delegate: RaceResultsViewModelDelegate?

    init(
        dataStore: RaceResultsViewModelDataStore,
        seasonAPI: SeasonAPIInterface
    ) {
        self.dataStore = dataStore
        self.seasonAPI = seasonAPI
    }

    func fetchResults() {
        delegate?.startLoading()
        seasonAPI.getRaceResults(season: dataStore.season, round: dataStore.round) { [weak self] result in
            guard let self else { return }

            delegate?.stopLoading()

            switch result {
            case .success(let response):
                dataStore.race = response.mrData.raceTable.races.first
                delegate?.didFetchResults()
            case .failure(let error):
                print(error)
            }
        }
    }

    func numberOfRows() -> Int {
        return dataStore.race?.results?.count ?? 0
    }

    func configurationFor(row: Int) -> RaceResultsTableViewCell.Configuration? {
        guard let raceResult = dataStore.race?.results?[safe: row] else {
            return nil
        }

        return RaceResultsTableViewCell.Configuration(
            position: raceResult.position,
            driverName: "\(raceResult.driver.givenName) \(raceResult.driver.familyName)"
        )
    }
}
