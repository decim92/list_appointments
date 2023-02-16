import Foundation

protocol RequestCreator {
    func request(with route: Route) -> URLRequest?
}

protocol Configuration {
    var baseURL: String { get }
}
