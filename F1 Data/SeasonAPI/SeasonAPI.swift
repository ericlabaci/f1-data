import Foundation

protocol SeasonAPIInterface: AnyObject {
    func getSeasonRaces(season: String, completion: @escaping (Result<SeasonInfo, Error>) -> Void)
}

final class SeasonAPI: SeasonAPIInterface {
    private let networking: NetworkingInterface

    init(networking: NetworkingInterface) {
        self.networking = networking
    }

    func getSeasonRaces(season: String, completion: @escaping (Result<SeasonInfo, Error>) -> Void) {
        networking.request(request: SeasonRequests.getSeasonRaces(season: season)) { (result: Result<SeasonInfo, Error>) in
            completion(result)
        }
    }
}
