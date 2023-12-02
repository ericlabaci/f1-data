import Foundation
import UIKit

struct SeasonRacesListingFeature {
    init() {

    }

    func viewController() -> UIViewController {
        let customView = SeasonRacesListingComponent()
        let viewModel = SeasonRacesListingViewModel()
        let viewController = SeasonRacesListingViewController(
            customView: customView,
            viewModel: viewModel
        )
        customView.delegate = viewController
        viewModel.delegate = viewController
        return viewController
    }
}
