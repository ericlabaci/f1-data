import Foundation

protocol SeasonRacesListingViewModelDelegate: AnyObject {

}

protocol SeasonRacesListingViewModelInterface: AnyObject {

}

final class SeasonRacesListingViewModel: SeasonRacesListingViewModelInterface {
    weak var delegate: SeasonRacesListingViewModelDelegate?
}
