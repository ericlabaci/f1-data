import Foundation

final class DependenciesHandler {
    let networking: Networking = {
        let configuration = NetworkingConfiguration(baseUrl: URL(string: "https://ergast.com")!)
        let networking = Networking(configuration: configuration)
        return networking
    }()

    var seasonAPI: SeasonAPIInterface {
        return SeasonAPI(networking: networking)
    }
}
