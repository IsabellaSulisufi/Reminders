//
//  RemindersApp.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI

@main
struct RemindersApp: App {
    @StateObject private var viewModel = ReminderViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
