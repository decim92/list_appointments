import Foundation

protocol NetworkServiceProvider {
    var networkService: NetworkService { get }
    var requestCreator: RequestCreator { get }
}

final class LiveNetworkProvider: NetworkServiceProvider {
    var networkService: NetworkService = LiveNetworkService()
    var requestCreator: RequestCreator = NetworkRequestCreator(configuration: NetworkConfiguration())
}
