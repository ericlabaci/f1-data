import Alamofire
import Foundation

enum SeasonRequests: NetworkingRequest {
    case getSeasonRaces(season: String)

    var path: String {
        switch self {
        case .getSeasonRaces(let season):
            return "api/f1/\(season).json"
        }
    }

    var method: Alamofire.HTTPMethod {
        switch self {
        case .getSeasonRaces:
            return .get
        }
    }
}
