import Cartography
import Foundation
import UIKit

final class LoadingComponent: UIView {
    private let activityIndicator = UIActivityIndicatorView(style: .medium)

    init() {
        super.init(frame: .zero)

        setupViewCodeComponent()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    func startLoading() {
        activityIndicator.startAnimating()
    }

    func stopLoading() {
        activityIndicator.stopAnimating()
    }
}

extension LoadingComponent: ViewCodeProtocol {
    func addSubviews() {
        addSubview(activityIndicator)
    }

    func constrainSubviews() {
        Cartography.constrain(self, activityIndicator) { superview, activityIndicator in
            activityIndicator.center == superview.center
        }
    }
}
