import Foundation

protocol AppointmentRepository {
    func getAppointments(completion: @escaping ([Appointment]?, _ errorMessage: String?) -> Void)
}

struct LiveAppointmentRepository: AppointmentRepository {
    private let tenantId = "1007"
    private let networkProvider: NetworkServiceProvider
    
    init(networkProvider: NetworkServiceProvider) {
        self.networkProvider = networkProvider
    }

    func getAppointments(completion: @escaping ([Appointment]?, _ errorMessage: String?) -> Void) {
        getAppointments { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    completion(result.appointments, nil)
                case .failure(let error):
                    completion(nil, error.message)
                }
            }
        }
        
    }
    
    private func getAppointments(
        completion: @escaping (_ result: Swift.Result<AppointmentsResult, NetworkServiceError>) -> Void
    ) {
        let route = Route.getAppointments(tenantId: tenantId)
        if let request = networkProvider.requestCreator.request(with: route) {
            networkProvider.networkService.execute(request: request, completion: completion)
        }
    }
}
