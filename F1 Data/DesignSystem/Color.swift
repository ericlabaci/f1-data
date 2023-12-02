import Foundation
import UIKit

enum Color {
    case primaryWhite
    case primaryBlack
    case mediumGray
    case background

    var color: UIColor {
        switch self {
        case .primaryWhite:
            return UIColor(hex: "#FFFFFF")
        case .primaryBlack:
            return UIColor(hex: "#000000")
        case .mediumGray:
            return UIColor(hex: "#656565")
        case .background:
            return UIColor(hex: "#FBFBFB")
        }
    }
}

private extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.index(hex.startIndex, offsetBy: 1)

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff

        self.init(red: CGFloat(red) / 0xff, green: CGFloat(green) / 0xff, blue: CGFloat(blue) / 0xff, alpha: 1)
    }
}
