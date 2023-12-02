import Foundation
import UIKit

protocol ErrorDisplayable: AnyObject {
    func showError()
}

extension ErrorDisplayable where Self: UIViewController {
    func showError() {
        print("Show Error")
    }
}
