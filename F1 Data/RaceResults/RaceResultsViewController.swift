import Foundation
import UIKit

final class RaceResultsViewController: UIViewController {
    private let customView: RaceResultsComponent
    private let router: RaceResultsRouterInterface
    private let viewModel: RaceResultsViewModelInterface

    init(
        customView: RaceResultsComponent,
        router: RaceResultsRouterInterface,
        viewModel: RaceResultsViewModelInterface
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

        viewModel.fetchResults()
    }
}

extension RaceResultsViewController: RaceResultsComponentDelegate {

}

extension RaceResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configuration = viewModel.configurationFor(row: indexPath.row) else {
            return UITableViewCell()
        }
        let cell: RaceResultsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.build(configuration: configuration)
        cell.delegate = self
        return cell
    }
}

extension RaceResultsViewController: UITableViewDelegate {

}

extension RaceResultsViewController: RaceResultsViewModelDelegate {
    func didFetchResults() {
        navigationItem.title = viewModel.navigationTitle

        customView.reloadData()
    }
}

extension RaceResultsViewController: RaceResultsTableViewCellDelegate {

}
