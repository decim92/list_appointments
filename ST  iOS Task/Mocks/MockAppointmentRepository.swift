import Foundation
struct MockAppointmentRepository: AppointmentRepository {
    func getAppointments(completion: @escaping ([Appointment]?, String?) -> Void) {
        completion([
            Appointment(
                id: 5,
                durationInMinutes: 45,
                overrideName: "First Lipo Visit",
                bookingDeposit: 5.1
            ),
            Appointment(
                id: 17,
                durationInMinutes: 20,
                overrideName: "Injectable - Kybella",
                bookingDeposit: 0
            ),
        ], nil)
    }
}
