//
//  PushNotificationView.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 30/09/2026.
//

import SwiftUI
import Combine

struct PushNotificationView: View {

    var body: some View {
        VStack {
            Button("Request for push notifications") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge, .sound]) { _, _ in }
            }
        }
    }
}

#Preview {
    PushNotificationView()
}
