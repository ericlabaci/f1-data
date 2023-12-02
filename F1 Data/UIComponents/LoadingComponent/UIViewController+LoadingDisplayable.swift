import Cartography
import Foundation
import UIKit

protocol LoadingDisplayable: AnyObject {
    func startLoading()
    func stopLoading()
}

extension LoadingDisplayable where Self: UIViewController {
    func startLoading() {
        view.showLoading(backgroundColor: view.backgroundColor)
    }

    func stopLoading() {
        view.hideLoading()
    }
}

extension UIView {
    static var loadingComponentKey = "UIView.LoadingComponent"

    private var loadingComponent: LoadingComponent {
        guard let loadingComponent = objc_getAssociatedObject(self, &UIView.loadingComponentKey) as? LoadingComponent else {
            let component = LoadingComponent()
            component.isUserInteractionEnabled = false
            objc_setAssociatedObject(self, &UIView.loadingComponentKey, component, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return component
        }
        return loadingComponent
    }

    func showLoading(backgroundColor: UIColor? = nil) {
        loadingComponent.removeFromSuperview()
        addSubview(loadingComponent)
        Cartography.constrain(self, loadingComponent) { superview, loadingComponent in
            loadingComponent.edges == superview.edges
        }
        if let color = backgroundColor {
            loadingComponent.backgroundColor = color
        }
        loadingComponent.startLoading()
    }

    func hideLoading() {
        loadingComponent.removeFromSuperview()
        loadingComponent.stopLoading()
    }
}
