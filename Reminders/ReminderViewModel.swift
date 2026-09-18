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
    
    var exampleReminder = Reminder(reminder: "buy bananas", dueDate: Date.distantFuture, timeDue: Date.distantFuture, isCompleted: false)

      func emptyAllReminders() {
          reminderList.removeAll()
          print(reminderList)
      }

      func addReminderToList() {
          let newReminder = Reminder(
            reminder: "", dueDate: Date(), timeDue: Date(), isCompleted: false
          )
          
          reminderList.append(newReminder)
          print(reminderList)
      }
}
