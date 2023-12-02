import Foundation
import UIKit

final class SeasonRacesListingViewController: UIViewController {
    private let customView: SeasonRacesListingComponent
    private let viewModel: SeasonRacesListingViewModelInterface

    init(
        customView: SeasonRacesListingComponent,
        viewModel: SeasonRacesListingViewModelInterface
    ) {
        self.customView = customView
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    override func loadView() {
        view = customView
    }
}

extension SeasonRacesListingViewController: SeasonRacesListingComponentDelegate {

}

extension SeasonRacesListingViewController: SeasonRacesListingViewModelDelegate {

}
