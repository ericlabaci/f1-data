import Foundation
import XCTest

@testable import F1_Data

final class SeasonRacesListingViewControllerTests: XCTestCase {
    private let customViewSpy = SeasonRacesListingComponentInterfaceSpy()
    private let routerSpy = SeasonRacesListingRouterInterfaceSpy()
    private let viewModelSpy = SeasonRacesListingViewModelInterfaceSpy()
    private lazy var sut = SeasonRacesListingViewController(
        customView: customViewSpy,
        router: routerSpy,
        viewModel: viewModelSpy
    )

    // MARK: - viewDidLoad

    func test_viewDidLoad_shouldCallFetchSeasonRaces() {
        sut.viewDidLoad()

        XCTAssertTrue(viewModelSpy.fetchSeasonRacesCalled)
    }

    // MARK: - didFetchSeasonRaces

    func test_didFetchSeasonRaces_shouldCallReloadData() {
        sut.didFetchSeasonRaces()

        XCTAssertTrue(customViewSpy.reloadDataCalled)
    }

    // MARK: - didTapOpenExternalLink

    func test_didTapOpenExternalLink_whenViewModelReturnsUrl_shouldCallOpenExternalLink() {
        viewModelSpy.raceExternalLinkReturn = "link.com"

        sut.didTapOpenExternalLink(id: "id")

        XCTAssertTrue(routerSpy.openExternalLinkCalled)
        XCTAssertEqual(routerSpy.openExternalLinkUrlPassed, "link.com")
    }

    func test_didTapOpenExternalLink_whenViewModelDoesNotReturnUrl_shouldNotCallOpenExternalLink() {
        viewModelSpy.raceExternalLinkReturn = nil

        sut.didTapOpenExternalLink(id: "id")

        XCTAssertFalse(routerSpy.openExternalLinkCalled)
    }
}
