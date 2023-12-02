import Cartography
import Foundation
import UIKit

protocol SeasonRaceTableViewCellDelegate: AnyObject {
    func didTapOpenExternalLink(id: String)
}

final class SeasonRaceTableViewCell: UITableViewCell {
    private let stackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, spacing: Spacing.c12)
        stackView.alignment = .top
        return stackView
    }()

    private let contentStackView = UIStackView(axis: .vertical, spacing: Spacing.c8)

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

    private lazy var externalLinkButton: UIButton = {
        let button = UIButton()
        button.setImage(Asset.iconExternal.image, for: .normal)
        button.contentVerticalAlignment = .top
        button.addTarget(self, action: #selector(didTapExternalLinkButton), for: .touchUpInside)
        return button
    }()

    private var configuration: Configuration?

    weak var delegate: SeasonRaceTableViewCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViewCodeComponent()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    @objc
    private func didTapExternalLinkButton() {
        guard let configuration else {
            return
        }

        delegate?.didTapOpenExternalLink(id: configuration.id)
    }

    private enum Constants {
        static let externalLinkButtonSize: CGFloat = 24
    }
}

extension SeasonRaceTableViewCell: ViewCodeProtocol {
    func configureView() {
        selectionStyle = .none
        backgroundColor = .clear
    }

    func addSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubviews(contentStackView, externalLinkButton)
        contentStackView.addArrangedSubviews(raceNameLabel, circuitNameLabel, raceDateLabel)
    }

    func constrainSubviews() {
        Cartography.constrain(contentView, stackView) { superview, stackView in
            stackView.edges == inset(superview.edges, Spacing.c24, Spacing.c16)
        }

        Cartography.constrain(externalLinkButton) { externalLinkButton in
            externalLinkButton.width == Constants.externalLinkButtonSize
            externalLinkButton.height == Constants.externalLinkButtonSize
        }

        contentStackView.setCustomSpacing(Spacing.c4, after: circuitNameLabel)
    }
}

extension SeasonRaceTableViewCell {
    struct Configuration {
        let id: String
        let raceName: String
        let circuitName: String
        let raceDate: String
    }

    func build(configuration: Configuration) {
        self.configuration = configuration
        raceNameLabel.text = configuration.raceName
        circuitNameLabel.text = configuration.circuitName
        raceDateLabel.text = configuration.raceDate
    }
}
