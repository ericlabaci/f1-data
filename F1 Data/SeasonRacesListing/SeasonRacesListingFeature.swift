import Foundation
import UIKit

struct SeasonRacesListingFeature {
    func viewController() -> UIViewController {
        let customView = SeasonRacesListingComponent()
        let router = SeasonRacesListingRouter()
        let viewModel = SeasonRacesListingViewModel(seasonAPI: dependenciesHandler.seasonAPI)
        let viewController = SeasonRacesListingViewController(
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
