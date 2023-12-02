import Foundation

@testable import F1_Data

protocol LoadingDisplayableSpy: LoadingDisplayable {}

extension LoadingDisplayableSpy {
    func startLoading() {}

    func stopLoading() {}
}
