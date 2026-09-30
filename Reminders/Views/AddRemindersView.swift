//
//  AddRemindersView.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI

struct AddReminderView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: ReminderViewModel
    @State private var showError = false
    @State private var navigateToHome = false
    @State private var dateViewOpen = false
    @State private var timeViewOpen = false

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

                    TextField("Pick up dry cleaning", text: $viewModel.reminderTitle)
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(Color.primaryText)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 18)
                .background(Color.cardRow)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

                // Date / time picker
                VStack(spacing: 25) {
                    // Date picker
                    Button {
                        dateViewOpen.toggle()
                    } label: {
                        PickerFieldView(
                            label: "DATE",
                            value: viewModel.dueDateAndTime.formatted(
                                .dateTime
                                    .weekday(.abbreviated)
                                    .day()
                                    .month(.abbreviated)
                            )
                        )
                    }

                    if dateViewOpen {
                        DatePicker("", selection: $viewModel.dueDateAndTime, in: Date.now..., displayedComponents: .date
                        )
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 8)
                        .onChange(of: viewModel.dueDateAndTime) {
                            dateViewOpen = false
                        }
                    }

                    // Time Picker
                    Button {
                        timeViewOpen.toggle()
                    } label: {
                        PickerFieldView(
                            label: "TIME",
                            value: viewModel.dueDateAndTime.formatted(.dateTime.hour().minute())
                        )
                    }

                    if timeViewOpen {
                        DatePicker("", selection: $viewModel.dueDateAndTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel)
                            .padding(.horizontal, 8)
                            .onChange(of: viewModel.dueDateAndTime) {
                                timeViewOpen = false
                            }
                    }
                }

                Spacer(minLength: 0)

                VStack {
                    Button {
                        if viewModel.dueDateAndTime <= Date() {
                            showError = true
                        } else {
                            viewModel.addReminderToList()
                            viewModel.resetRemindersForm()
                            navigateToHome = true
                        }
                    } label: {
                        Text("Add Reminder")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color.cardRow)
                            .frame(maxWidth: .infinity)
                            .padding(18)
                            .background(Color.primaryCta)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 22, style: .continuous)
                            )
                    }
                }
                .navigationDestination(isPresented: $navigateToHome) {
                    HomeView()
                }
                .alert("Invalid Time", isPresented: $showError) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("Please select a time in the future.")
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
