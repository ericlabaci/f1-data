import Foundation

@testable import F1_Data

protocol ErrorDisplayableSpy: ErrorDisplayable {}

extension ErrorDisplayableSpy {
    func showError() {}
}
