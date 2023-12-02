import Alamofire
import Foundation

enum SeasonRequests: NetworkingRequest {
    case getSeasonRaces(season: String)
    case getRaceResults(season: String, round: String)

    var path: String {
        switch self {
        case .getSeasonRaces(let season):
            return "api/f1/\(season).json"
        case .getRaceResults(let season, let round):
            return "api/f1/\(season)/\(round)/results.json"
        }
    }

    var method: Alamofire.HTTPMethod {
        switch self {
        case .getSeasonRaces:
            return .get
        case .getRaceResults:
            return .get
        }
    }
}
