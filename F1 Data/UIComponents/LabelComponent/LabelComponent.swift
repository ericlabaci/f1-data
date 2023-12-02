import Foundation
import UIKit

final class LabelComponent: UILabel {
    var typography: Typography = .body {
        didSet {
            font = typography.font
        }
    }

    var color: Color = .primaryBlack {
        didSet {
            textColor = color.color
        }
    }

    init() {
        super.init(frame: .zero)

        configureView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    private func configureView() {
        font = typography.font
        textColor = color.color
    }
}
