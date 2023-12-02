import Foundation
import UIKit

protocol LoadingDisplayable: AnyObject {
    func startLoading()
    func stopLoading()
}

extension LoadingDisplayable where Self: UIViewController {
    func startLoading() {

    }

    func stopLoading() {

    }
}
