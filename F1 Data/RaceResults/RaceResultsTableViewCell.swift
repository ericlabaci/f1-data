import Cartography
import Foundation
import UIKit

protocol RaceResultsTableViewCellDelegate: AnyObject {

}

final class RaceResultsTableViewCell: UITableViewCell {
    private let stackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, spacing: Spacing.c8)
        stackView.alignment = .leading
        return stackView
    }()

    private let firstLineStackView = UIStackView(axis: .horizontal, spacing: Spacing.c12)

    private let positionLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .body
        label.color = .primaryBlack
        return label
    }()

    private let driverNameLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .body
        label.color = .primaryBlack
        return label
    }()

    private let secondLineStackView = UIStackView(axis: .horizontal, spacing: Spacing.c12)

    private let pointsGainedLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .subtitle
        label.color = .mediumGray
        return label
    }()

    private let startingPositionLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .subtitle
        label.color = .mediumGray
        return label
    }()

    private let positionsGainedLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .subtitle
        label.color = .mediumGray
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
        stackView.addArrangedSubviews(firstLineStackView, secondLineStackView)
        firstLineStackView.addArrangedSubviews(positionLabel, driverNameLabel)
        secondLineStackView.addArrangedSubviews(pointsGainedLabel, startingPositionLabel, positionsGainedLabel)
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
        let pointsGained: String
        let startingPosition: String
        let positionsGained: String
    }

    func build(configuration: Configuration) {
        self.configuration = configuration
        positionLabel.text = configuration.position
        driverNameLabel.text = configuration.driverName
        pointsGainedLabel.text = configuration.pointsGained
        startingPositionLabel.text = configuration.startingPosition
        positionsGainedLabel.text = configuration.positionsGained
    }
}
