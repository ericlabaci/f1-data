import Foundation
import UIKit

enum Typography {
    case body
    case subtitle

    var font: UIFont {
        return .systemFont(ofSize: size, weight: weight)
    }

    private var size: CGFloat {
        switch self {
        case .body:
            return 16
        case .subtitle:
            return 14
        }
    }

    private var weight: UIFont.Weight {
        switch self {
        case .body:
            return .regular
        case .subtitle:
            return .light
        }
    }
}
