import Foundation

protocol SeasonRacesListingViewModelDelegate: AnyObject, LoadingDelegate {
    func didFetchSeasonRaces()
}

protocol SeasonRacesListingViewModelInterface: AnyObject {
    func fetchSeasonRaces()
    func raceExternalLink(id: String) -> String?
    func numberOfRows() -> Int
    func configurationFor(row: Int) -> SeasonRaceTableViewCell.Configuration?
}

final class SeasonRacesListingViewModelDataStore {
    var selectedSeason = "current"
    var season: SeasonInfo.MRData.RaceTable?
}

final class SeasonRacesListingViewModel: SeasonRacesListingViewModelInterface {
    private let dataStore: SeasonRacesListingViewModelDataStore
    private let inputDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()
    private let outputDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()
    private let seasonAPI: SeasonAPIInterface

    weak var delegate: SeasonRacesListingViewModelDelegate?

    init(
        dataStore: SeasonRacesListingViewModelDataStore = SeasonRacesListingViewModelDataStore(),
        seasonAPI: SeasonAPIInterface
    ) {
        self.dataStore = dataStore
        self.seasonAPI = seasonAPI
    }

    func fetchSeasonRaces() {
        delegate?.startLoading()
        seasonAPI.getSeasonRaces(season: dataStore.selectedSeason) { [weak self] result in
            guard let self else { return }

            delegate?.stopLoading()

            switch result {
            case .success(let response):
                dataStore.season = response.mrData.raceTable
                delegate?.didFetchSeasonRaces()
            case .failure(let error):
                print(error)
            }
        }
    }

    func raceExternalLink(id: String) -> String? {
        return dataStore.season?.races.first(where: { $0.id == id })?.url
    }

    func numberOfRows() -> Int {
        return dataStore.season?.races.count ?? 0
    }

    func configurationFor(row: Int) -> SeasonRaceTableViewCell.Configuration? {
        guard let race = dataStore.season?.races[safe: row] else {
            return nil
        }

        let raceDate: String = {
            guard let raceDate = inputDateFormatter.date(from: race.date) else {
                return race.date
            }
            return outputDateFormatter.string(from: raceDate)
        }()

        return SeasonRaceTableViewCell.Configuration(
            id: race.id,
            raceName: race.raceName,
            circuitName: race.circuit.circuitName,
            raceDate: raceDate
        )
    }
}
