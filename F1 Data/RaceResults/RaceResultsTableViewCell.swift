import Cartography
import Foundation
import UIKit

protocol RaceResultsTableViewCellDelegate: AnyObject {

}

final class RaceResultsTableViewCell: UITableViewCell {
    private let stackView = UIStackView(axis: .vertical, spacing: Spacing.c8)

    private let firstLineStackView = UIStackView(axis: .horizontal, spacing: Spacing.c12)

    private let positionLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .body
        label.color = .primaryBlack
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()

    private let driverNameLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .body
        label.color = .primaryBlack
        return label
    }()

    private var configuration: Configuration?

    weak var delegate: RaceResultsTableViewCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViewCodeComponent()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
}

extension RaceResultsTableViewCell: ViewCodeProtocol {
    func configureView() {
        selectionStyle = .none
        backgroundColor = .clear
    }

    func addSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubviews(firstLineStackView)
        firstLineStackView.addArrangedSubviews(positionLabel, driverNameLabel)
    }

    func constrainSubviews() {
        Cartography.constrain(contentView, stackView) { superview, stackView in
            stackView.edges == inset(superview.edges, Spacing.c24, Spacing.c16)
        }
    }
}

extension RaceResultsTableViewCell {
    struct Configuration {
        let position: String
        let driverName: String
    }

    func build(configuration: Configuration) {
        self.configuration = configuration
        positionLabel.text = configuration.position
        driverNameLabel.text = configuration.driverName
    }
}
