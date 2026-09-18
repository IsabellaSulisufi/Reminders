//
//  HomeView.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ReminderViewModel()

    var body: some View {
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

                
                HStack {
                    NavigationLink(destination: AddReminderView()) {
                        Circle()
                            .stroke(.dividers, lineWidth: 3)
                            .frame(width: 25, height: 25)
                    }

                    VStack(alignment: .leading) {
                        Text("Buy bananas")
                            .font(.custom("Gill Sans", size: 20))
                            .foregroundColor(Color.primaryText)
                            .padding(.bottom, 2)

                        Text(Date.now, format: .dateTime.hour().minute())
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

//                .overlay(
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(Color.primaryCta, lineWidth: 1)
//                )

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
