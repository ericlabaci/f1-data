import Foundation
import UIKit

struct SeasonRacesListingFeature {
    func viewController() -> UIViewController {
        let customView = SeasonRacesListingComponent()
        let viewModel = SeasonRacesListingViewModel(seasonAPI: dependenciesHandler.seasonAPI)
        let viewController = SeasonRacesListingViewController(
            customView: customView,
            viewModel: viewModel
        )
        customView.delegate = viewController
        viewModel.delegate = viewController
        return viewController
    }
}
