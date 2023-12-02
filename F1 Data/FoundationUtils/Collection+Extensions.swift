import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return index < endIndex && index >= startIndex ? self[index] : nil
    }
}
