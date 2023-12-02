import Foundation
import UIKit

protocol LoadingDelegate: AnyObject {
    func startLoading()
    func stopLoading()
}

extension LoadingDelegate where Self: UIViewController {
    func startLoading() {

    }

    func stopLoading() {

    }
}
