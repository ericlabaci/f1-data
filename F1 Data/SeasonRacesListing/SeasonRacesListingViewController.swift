import Foundation
import UIKit

final class SeasonRacesListingViewController: UIViewController {
    private let customView: SeasonRacesListingComponent
    private let router: SeasonRacesListingRouterInterface
    private let viewModel: SeasonRacesListingViewModelInterface

    init(
        customView: SeasonRacesListingComponent,
        router: SeasonRacesListingRouterInterface,
        viewModel: SeasonRacesListingViewModelInterface
    ) {
        self.customView = customView
        self.router = router
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

        navigationItem.title = SeasonRaceListingStrings.Navigation.title

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
        cell.delegate = self
        return cell
    }
}

extension SeasonRacesListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let race = viewModel.race(row: indexPath.row) else {
            return
        }

        router.openRaceResults(season: race.season, round: race.round)
    }
}

extension SeasonRacesListingViewController: SeasonRacesListingViewModelDelegate {
    func didFetchSeasonRaces() {
        customView.reloadData()
    }
}

extension SeasonRacesListingViewController: SeasonRaceTableViewCellDelegate {
    func didTapOpenExternalLink(id: String) {
        guard let url = viewModel.raceExternalLink(id: id) else {
            return
        }
        router.openExternalLink(url: url)
    }
}
