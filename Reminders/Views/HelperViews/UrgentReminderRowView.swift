//
//  UrgentReminderRowView.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI

struct UrgentReminderRowView: View {
    let reminder: String
    let date: Date

    var body: some View {
        let diffComponents = Calendar.current.dateComponents([.hour, .minute], from: Date.now, to: date)
        let hours = diffComponents.hour ?? 0
        let minutes = diffComponents.minute ?? 0

        HStack {
            NavigationLink(destination: AddReminderView()) {
                Circle()
                    .stroke(.urgent, lineWidth: 3)
                    .frame(width: 25, height: 25)
            }

            VStack(alignment: .leading) {
                Text(reminder)
                    .font(.custom("Gill Sans", size: 20))
                    .foregroundColor(Color.primaryText)
                    .padding(.bottom, 2)

                if hours == 0 {
                    Text("In \(minutes) \(minutes == 1 ? "minute ·" : "minutes ·") \(date, format: .dateTime.hour().minute())")
                        .font(.custom("Gill Sans", size: 15))
                        .foregroundColor(Color.urgent)
                        .padding(.bottom, 6)
                        .fontWeight(.medium)
                } else if minutes == 0 {
                    Text("In \(hours) hours · \(date, format: .dateTime.hour().minute())")
                        .font(.custom("Gill Sans", size: 15))
                        .foregroundColor(Color.urgent)
                        .padding(.bottom, 6)
                        .fontWeight(.medium)

                } else {
                    Text("In \(hours) hours and \(minutes) minutes · \(date, format: .dateTime.hour().minute())")
                        .font(.custom("Gill Sans", size: 15))
                        .foregroundColor(Color.urgent)
                        .padding(.bottom, 6)
                        .fontWeight(.medium)
                }
            }
            .padding(12)
            Spacer()

        }
        .padding(10)
        .padding(.leading, 15)
        .background(Color.cardRow)
        .cornerRadius(22)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.urgent, lineWidth: 2)
        )
    }
}

#Preview {
    UrgentReminderRowView(reminder: "Buy bread and eggs", date: Date.now.addingTimeInterval(80))
    UrgentReminderRowView(reminder: "Buy bananas", date: Date.now.addingTimeInterval(800))
    UrgentReminderRowView(reminder: "Clean room", date: Date.now.addingTimeInterval(30670))
}
