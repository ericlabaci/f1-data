import Foundation
import UIKit

protocol SeasonRacesListingRouterInterface: AnyObject {
    func openRaceResults(season: String, round: String)
    func openExternalLink(url: String)
}

final class SeasonRacesListingRouter: SeasonRacesListingRouterInterface {
    weak var viewController: UIViewController?

    func openRaceResults(season: String, round: String) {
        guard let viewController else { return }

        let raceResultsViewController = RaceResultsFeature(season: season, round: round).viewController()
        viewController.navigationController?.pushViewController(raceResultsViewController, animated: true)
    }

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
