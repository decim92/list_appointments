//
//  ST__iOS_TaskApp.swift
//  ST  iOS Task
//
//  Created by Douglas Poveda on 16/02/23.
//

import SwiftUI

@main
struct ST__iOS_TaskApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: ContentViewModel(
                    repository: LiveAppointmentRepository(
                        networkProvider: LiveNetworkProvider()
                    )
                )
            )
        }
    }
}
