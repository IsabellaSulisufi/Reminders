//
//  AddRemindersView.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI

struct AddReminderView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = ReminderViewModel()

    @State private var dateViewOpen = false
    @State private var timeViewOpen = false
    @State private var taskName: String = ""
    @State private var date: Date = .now
    @State private var time: Date = .now

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("New Reminder")
                    .font(.custom("Fraunces", size: 20))
                    .foregroundStyle(Color.primaryText)

                // Task name field
                VStack(alignment: .leading, spacing: 8) {
                    Text("WHAT DO YOU WANT TO DO?")
                        .font(.system(size: 13, weight: .medium))
                        .tracking(0.5)
                        .foregroundStyle(Color.secondaryText)

                    TextField("Pick up dry cleaning", text: $taskName)
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(Color.primaryText)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 18)
                .background(Color.cardRow)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

                // Date / time picker
                VStack {
                    // Date Picker
                    Button {
                        dateViewOpen.toggle()
                    } label: {
                        PickerFieldView(
                            label: "DATE",
                            value: date.formatted(.dateTime.weekday(.abbreviated).day().month(.abbreviated))
                        )
                    }
                    if dateViewOpen {
                        Divider()
                        DatePicker("", selection: $date, in: Date.now..., displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .padding(.horizontal, 8)
                            .onChange(of: date) { dateViewOpen = false }
                    }
                }
                
                // Time Picker
                Button {
                    timeViewOpen.toggle()
                } label: {
                    PickerFieldView(
                        label: "TIME",
                        value: time.formatted(.dateTime.hour().minute())
                    )
                }
                if timeViewOpen {
                    Divider()
                    DatePicker("", selection: $time, in: Date.now..., displayedComponents: .hourAndMinute)
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 8)
                        .onChange(of: time) { timeViewOpen = false }
                }
                Spacer(minLength: 0)

                // Add button
                Button {
                    viewModel.addReminderToList()
                } label: {
                    Text("Add Reminder")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(Color.cardRow)
                        .frame(maxWidth: .infinity)
                        .padding(17)
                        .background(Color.primaryCta)
                        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                }
            }
            .padding(20)
            .background(Color.background)
        }
    }
}

#Preview {
    AddReminderView()
}
