import Cartography
import Foundation
import UIKit

protocol SeasonRacesListingComponentDelegate: AnyObject {

}

protocol SeasonRacesListingComponentInterface: UIView {
    var tableViewDelegates: (UITableViewDataSource & UITableViewDelegate)? { get set }

    func reloadData()
}

final class SeasonRacesListingComponent: UIView, SeasonRacesListingComponentInterface {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(SeasonRaceTableViewCell.self)
        return tableView
    }()

    var tableViewDelegates: (UITableViewDataSource & UITableViewDelegate)? {
        get {
            return nil
        }
        set {
            tableView.dataSource = newValue
            tableView.delegate = newValue
        }
    }
    weak var delegate: SeasonRacesListingComponentDelegate?

    init() {
        super.init(frame: .zero)

        setupViewCodeComponent()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    func reloadData() {
        tableView.reloadData()
    }
}

extension SeasonRacesListingComponent: ViewCodeProtocol {
    func configureView() {
        backgroundColor = Color.background.color
    }

    func addSubviews() {
        addSubview(tableView)
    }

    func constrainSubviews() {
        Cartography.constrain(self, tableView) { superview, tableView in
            tableView.edges == superview.edges
        }
    }
}
