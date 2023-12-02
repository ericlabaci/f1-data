import Cartography
import Foundation
import UIKit

final class SeasonRaceTableViewCell: UITableViewCell {
    private let stackView = UIStackView(axis: .vertical, spacing: Spacing.c12)

    private let raceNameLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .body
        label.color = .primaryBlack
        return label
    }()

    private let circuitNameLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .subtitle
        label.color = .mediumGray
        return label
    }()

    private let raceDateLabel: LabelComponent = {
        let label = LabelComponent()
        label.typography = .subtitle
        label.color = .mediumGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViewCodeComponent()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
}

extension SeasonRaceTableViewCell: ViewCodeProtocol {
    func configureView() {
        selectionStyle = .none
        backgroundColor = .clear
    }

    func addSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubviews(raceNameLabel, circuitNameLabel, raceDateLabel)
    }

    func constrainSubviews() {
        Cartography.constrain(contentView, stackView) { superview, stackView in
            stackView.edges == inset(superview.edges, Spacing.c24, Spacing.c16)
        }
        stackView.setCustomSpacing(Spacing.c4, after: circuitNameLabel)
    }
}

extension SeasonRaceTableViewCell {
    struct Configuration {
        let raceName: String
        let circuitName: String
        let raceDate: String
    }

    func build(configuration: Configuration) {
        raceNameLabel.text = configuration.raceName
        circuitNameLabel.text = configuration.circuitName
        raceDateLabel.text = configuration.raceDate
    }
}
