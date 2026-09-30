//
//  Model.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import Foundation

struct Reminder: Codable, Identifiable {
    var id = UUID() // SwiftUI needs to know how to uniquely identify each Reminder in the array so it can keep track of which row is which
    let reminder: String
    let dueDate: Date
    let timeDue: Date
    let isCompleted: Bool
}
