import Alamofire
import Foundation

protocol NetworkingRequest {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
}

extension NetworkingRequest {
    var headers: HTTPHeaders? {
        return nil
    }
}
