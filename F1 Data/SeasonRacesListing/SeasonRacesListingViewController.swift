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

        self.customView.tableViewDelegates = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = L10n.Navigation.title

        viewModel.fetchSeasonRaces()
    }
}

extension SeasonRacesListingViewController: SeasonRacesListingComponentDelegate {

}

extension SeasonRacesListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configuration = viewModel.configurationFor(row: indexPath.row) else {
            return UITableViewCell()
        }
        let cell: SeasonRaceTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.build(configuration: configuration)
        return cell
    }
}

extension SeasonRacesListingViewController: UITableViewDelegate {

}

extension SeasonRacesListingViewController: SeasonRacesListingViewModelDelegate {
    func didFetchSeasonRaces() {
        customView.reloadData()
    }
}
