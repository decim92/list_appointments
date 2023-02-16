//
//  ContentView.swift
//  ST  iOS Task
//
//  Created by Douglas Poveda on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    private let spacing = 10.0
    private let padding = 20.0
    
    var body: some View {
        NavigationView {
            ScrollView {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .error(let message):
                    ErrorView(message: message)
                case .success(let items):
                    LazyVStack(alignment: .leading, spacing: spacing) {
                        ForEach(items) { appointment in
                            NavigationLink {
                                DetailView(presentation: AppointmentPresentation(appointment: appointment))
                            } label: {
                                CellView(presentation: AppointmentPresentation(appointment: appointment))
                            }
                            .buttonStyle(.plain)
                        }
                    }.padding(padding)
                }
            }
            .navigationTitle("Appointments")
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onAppear {
            viewModel.getAppointments()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(repository: MockAppointmentRepository()))
    }
}
