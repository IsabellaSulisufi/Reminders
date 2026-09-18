//
//  ReminderRowView.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI

struct ReminderRowView: View {
    let reminder: String
    let date: Date
    
    var body: some View {
        HStack {
            NavigationLink(destination: AddReminderView()) {
                Circle()
                    .stroke(.dividers, lineWidth: 3)
                    .frame(width: 25, height: 25)
            }

            VStack(alignment: .leading) {
                Text(reminder)
                    .font(.custom("Gill Sans", size: 20))
                    .foregroundColor(Color.primaryText)
                    .padding(.bottom, 2)

                Text(date, format: .dateTime.hour().minute())
                    .font(.custom("Gill Sans", size: 15))
                    .foregroundColor(Color.secondaryText)
                    .padding(.bottom, 6)

            }
            .padding(12)
            Spacer()

        }
        .padding(10)
        .padding(.leading, 15)
        .background(Color.cardRow)
        .cornerRadius(22)
    }
}


#Preview {
    ReminderRowView(reminder: "buy bananas", date: Date.now.addingTimeInterval(86400))
}
