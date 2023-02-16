import SwiftUI

struct DetailView: View {
    let presentation: AppointmentPresentation
    var body: some View {
        VStack(alignment: .center) {
            Text(presentation.title).font(.title)
            Text(presentation.subtitle).font(.body)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(presentation: AppointmentPresentation(appointment: Appointment(id: 1, durationInMinutes: 10, overrideName: "Important Appointment", bookingDeposit: 11)))
    }
}
