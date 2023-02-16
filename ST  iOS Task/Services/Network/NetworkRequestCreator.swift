import Foundation

struct NetworkConfiguration: Configuration {
    var baseURL = "https://appointmentrequestsapi-dev.symplast.com"
}


final class NetworkRequestCreator: RequestCreator {
    private let configuration: Configuration
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    private struct Config {
        static let timeInterval = TimeInterval(10 * 1000)
    }

    func request(with route: Route) -> URLRequest? {
        guard var url = URL(string: configuration.baseURL) else { return nil }
        
        if let queryItems = route.queryItems, var components = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            components.queryItems = queryItems
            if let updatedUrl = components.url {
               url = updatedUrl
            }
        }
        
        var request = URLRequest(url: url.appendingPathComponent(route.path))
        request.httpMethod = route.method.rawValue
        request.timeoutInterval = Config.timeInterval
        return request
    }
}
