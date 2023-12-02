import Foundation
import UIKit

protocol SeasonRacesListingComponentDelegate: AnyObject {

}

final class SeasonRacesListingComponent: UIView {
    weak var delegate: SeasonRacesListingComponentDelegate?
}
