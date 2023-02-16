import UIKit

protocol NetworkService {
    func execute<T: Decodable>(request: URLRequest, completion: @escaping (_ result: Swift.Result<T, NetworkServiceError>) -> Void)
}

final class LiveNetworkService: NetworkService {
    func execute<T: Decodable>(request: URLRequest, completion: @escaping (_ result: Swift.Result<T, NetworkServiceError>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...204).contains(httpResponse.statusCode) else {
                completion(.failure(.statusCode))
                return
            }

            if let error = error {
                completion(.failure(.serverError(message: error.localizedDescription)))
            } else if let data = data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                } catch _ {
                    completion(.failure(.dataExpected))
                }
            } else {
                completion(.failure(.dataExpected))
            }
        }
        task.resume()
    }
}

struct BackendGeneralError: Decodable {
    let errors: [String]
}

enum NetworkServiceError: Error {
    case serverError(message: String)
    case noResponse
    case statusCode
    case dataExpected
    case badRequest
    case unexpectedStatusCode(Int)
    case unexpectedError
    
    var message: String {
        switch self {
        case .serverError(let message):
            return message
        case .noResponse:
            return "The server returned no response"
        case .dataExpected:
            return "Missing expected data to parse response"
        case .badRequest:
            return "Bad request"
        case .unexpectedStatusCode(let int):
            return "Unexpected Status code \(int)"
        case .unexpectedError:
            return "Unexpected error"
        default: return "There was an unknown error"
        }
    }
}
