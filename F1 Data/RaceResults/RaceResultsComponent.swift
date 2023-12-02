import Cartography
import Foundation
import UIKit

protocol RaceResultsComponentDelegate: AnyObject {

}

final class RaceResultsComponent: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(RaceResultsTableViewCell.self)
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
    weak var delegate: RaceResultsComponentDelegate?

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

extension RaceResultsComponent: ViewCodeProtocol {
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
