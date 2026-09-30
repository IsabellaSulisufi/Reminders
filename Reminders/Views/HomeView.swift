//
//  HomeView.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI
import Combine

struct HomeView: View {
    @EnvironmentObject var viewModel: ReminderViewModel
    let now = Date()

    var body: some View {
        let next24Hours = now.addingTimeInterval(24 * 60 * 60)
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(Date.now.formatted(.dateTime.weekday(.wide)))
                            .font(.system(size: 16))
                            .foregroundColor(Color.secondaryText)

                        Text("Reminders")
                            .font(.system(size: 34).italic())
                            .foregroundColor(Color.primaryText)
                    }
                    Spacer()
                    NavigationLink(destination: AddReminderView()) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color.primaryCta)
                            .cornerRadius(25)
                }
                }
                .padding(.bottom, 20)
                if viewModel.reminderList.isEmpty {
                    Text("No reminders due :D")
                        .font(.system(size: 16))
                        .foregroundColor(Color("urgent"))
                } else {
                    ForEach(viewModel.reminderList) { reminder in

                        if reminder.dueDate >= now &&
                           reminder.dueDate <= next24Hours {

                            UrgentReminderRowView(
                                reminder: reminder.reminder,
                                date: reminder.dueDate
                            )

                        } else {

                            ReminderRowView(
                                reminder: reminder.reminder,
                                date: reminder.dueDate
                            )
                        }
                    }
                }

                Spacer()
            }
            .padding(20)
            .background(Color.background)
        }
    }
}

#Preview {
    HomeView()
}
