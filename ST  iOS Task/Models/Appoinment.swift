import Foundation
struct AppointmentsResult: Decodable {
    let appointments: [Appointment]?
    
    enum CodingKeys: String, CodingKey {
        case appointments = "result"
    }
}

struct Appointment: Decodable, Identifiable {
    let id: Int
    let durationInMinutes: Int
    let overrideName: String
    let bookingDeposit: Double
    
    enum CodingKeys: String, CodingKey {
        case id, durationInMinutes, overrideName, bookingDeposit
    }
}
