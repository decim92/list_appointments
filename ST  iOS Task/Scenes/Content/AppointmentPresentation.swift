import Foundation

struct AppointmentPresentation {
    private let appointment: Appointment

    init(appointment: Appointment) {
        self.appointment = appointment
    }
    
    var title: String {
        return appointment.overrideName
    }
    
    var subtitle: String {
        return "\(appointment.durationInMinutes) min, \(bookingDeposit)"
    }
    
    private var bookingDeposit: String {
        return currencyFormatter.string(from: NSNumber(value: appointment.bookingDeposit)) ?? ""
    }
}
    

