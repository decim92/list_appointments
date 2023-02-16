import Foundation

enum Route {
    case getAppointments(tenantId: String)
    
    enum HTTPMethod: String {
        case get = "GET"
    }
    var method: HTTPMethod {
        switch self {
        case .getAppointments:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAppointments:
            return "AppointmentTypesPurposes"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getAppointments(let tenantId):
            return [
                URLQueryItem(name: "tenantId", value: tenantId)
            ]
        }
    }
}
