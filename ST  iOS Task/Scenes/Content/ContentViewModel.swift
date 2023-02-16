import UIKit

enum ContentViewState {
    case loading
    case error(message: String)
    case success(items: [Appointment])
}

final class ContentViewModel: ObservableObject {
    private let repository: AppointmentRepository

    private var appointments = [Appointment]() {
        didSet {
            filteredAppointments = appointments
        }
    }
    var filteredAppointments = [Appointment]() {
        didSet {
            state = .success(items: filteredAppointments)
        }
    }

    var errorMessage: String?

    @Published var state: ContentViewState = .loading
    @Published var searchText = "" {
        willSet {
            // It could be optimized by adding debouncing
            if !newValue .isEmpty {
                filteredAppointments = appointments.filter({ $0.overrideName.lowercased().contains(newValue.lowercased()) })
            } else {
                filteredAppointments = appointments
            }
        }
    }
    
    init(repository: AppointmentRepository) {
        self.repository = repository
    }
    
    func getAppointments() {
        repository.getAppointments { [weak self] appointments, errorMessage in
            if let appointments = appointments {
                self?.appointments = appointments
            } else if let errorMessage = errorMessage {
                self?.state = .error(message: errorMessage)
            }
        }
    }
}
