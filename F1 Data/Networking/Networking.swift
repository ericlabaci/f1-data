import Alamofire
import Foundation

protocol NetworkingInterface: AnyObject {
    func request<T: Decodable>(request: NetworkingRequest, completion: @escaping (Result<T, Error>) -> Void)
}

final class Networking: NetworkingInterface {
    private let configuration: NetworkingConfiguration

    init(configuration: NetworkingConfiguration) {
        self.configuration = configuration
    }

    func request<T: Decodable>(request: NetworkingRequest, completion: @escaping (Result<T, Error>) -> Void) {
        let url = configuration.baseUrl.appendingPathComponent(request.path)
        AF.request(url, method: request.method, headers: request.headers).responseDecodable(of: T.self, queue: .main) { result in
            if let error = result.error {
                completion(.failure(error))
            } else if let data = result.data {
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(responseObject))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
}
