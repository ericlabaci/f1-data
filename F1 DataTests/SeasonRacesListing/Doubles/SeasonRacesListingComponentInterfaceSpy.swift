import Foundation
import UIKit

@testable import F1_Data

final class SeasonRacesListingComponentInterfaceSpy: UIView, SeasonRacesListingComponentInterface {
    var tableViewDelegates: (UITableViewDataSource & UITableViewDelegate)?

    private(set) var reloadDataCalled = false
    func reloadData() {
        reloadDataCalled = true
    }
}
