import Foundation
import UIKit

protocol SeasonRacesListingRouterInterface: AnyObject {
    func openExternalLink(url: String)
}

final class SeasonRacesListingRouter: SeasonRacesListingRouterInterface {
    func openExternalLink(url: String) {
        guard
            let url = URL(string: url),
            UIApplication.shared.canOpenURL(url)
        else {
            return
        }
        UIApplication.shared.open(url)
    }
}
