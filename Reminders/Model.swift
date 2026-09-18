//
//  Model.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import Foundation

struct Reminder: Codable {
    let reminder: String
    let dueDate: Date
    let timeDue: Date
    let isCompleted: Bool
}
