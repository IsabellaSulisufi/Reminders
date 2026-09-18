//
//  UrgentReminderRow.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//


import SwiftUI

struct UrgentReminderRow: View {
    let reminder: String
    let date: Date
    
    var body: some View {
        HStack {
            NavigationLink(destination: AddReminderView()) {
                Circle()
                    .stroke(.primaryCta, lineWidth: 3)
                    .frame(width: 25, height: 25)
            }

            VStack(alignment: .leading) {
                Text("Buy bananas")
                    .font(.custom("Gill Sans", size: 20))
                    .foregroundColor(Color.primaryText)
                    .padding(.bottom, 2)

                
                Text("In (duedate - date.now)") // add this later
                Text(date, format: .dateTime.hour().minute())
                    .font(.custom("Gill Sans", size: 15))
                    .foregroundColor(Color.primaryCta)
                    .padding(.bottom, 6)

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
                .stroke(Color.primaryCta, lineWidth: 1)
        )
    }
}


#Preview {
    UrgentReminderRow(reminder: "Buy bread and eggs", date: Date.now.addingTimeInterval(86400))
}
