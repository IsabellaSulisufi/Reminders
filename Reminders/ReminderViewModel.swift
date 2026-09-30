//
//  ViewModel.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI
import Combine

class ReminderViewModel: ObservableObject {
    @Published var reminderList: [Reminder] = []
    @Published var reminderTitle: String = ""
    @Published var dueDateAndTime: Date = Date()
    @Published var isReminderComplete: Bool = false

    var exampleReminder = Reminder(reminder: "buy bananas", dueDate: Date.distantFuture, timeDue: Date.distantFuture, isCompleted: false)

      func emptyAllReminders() {
          reminderList.removeAll()
          print(reminderList)
      }

      func addReminderToList() {
          let newReminder = Reminder(
            reminder: reminderTitle, dueDate: dueDateAndTime, timeDue: dueDateAndTime, isCompleted: isReminderComplete
          )

          reminderList.append(newReminder)
          print(reminderList)
      }

    func resetRemindersForm() {
        reminderTitle = ""
        dueDateAndTime = Date()
    }

}
