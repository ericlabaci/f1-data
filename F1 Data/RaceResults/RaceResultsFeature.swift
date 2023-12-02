import Foundation
import UIKit

struct RaceResultsFeature {
    private let season: String
    private let round: String

    init(season: String, round: String) {
        self.season = season
        self.round = round
    }

    func viewController() -> UIViewController {
        let customView = RaceResultsComponent()
        let router = RaceResultsRouter()
        let dataStore = RaceResultsViewModelDataStore(season: season, round: round)
        let viewModel = RaceResultsViewModel(
            dataStore: dataStore,
            seasonAPI: dependenciesHandler.seasonAPI
        )
        let viewController = RaceResultsViewController(
            customView: customView,
            router: router,
            viewModel: viewModel
        )
        customView.delegate = viewController
        viewModel.delegate = viewController
        router.viewController = viewController
        return viewController
    }
}
