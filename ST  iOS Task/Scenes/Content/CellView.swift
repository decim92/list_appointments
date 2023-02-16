import SwiftUI

struct CellView: View {
    let presentation: AppointmentPresentation
    var body: some View {
        VStack(alignment: .leading) {
            Text(presentation.title).font(.title)
            Text(presentation.subtitle).font(.headline)
            Divider()
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(presentation: AppointmentPresentation(appointment: Appointment(id: 1, durationInMinutes: 10, overrideName: "Important Appointment", bookingDeposit: 11)))
    }
}
