//
//  PickerFieldView.swift
//  Reminders
//
//  Created by Isabella Sulisufi on 18/09/2026.
//

import SwiftUI

struct PickerFieldView: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(label)
                    .font(.system(size: 13, weight: .medium))
                    .tracking(0.5)
                    .foregroundStyle(Color.secondaryText)

                Text(value)
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(Color.primaryText)
            }

            Spacer(minLength: 0)

            Image(systemName: "chevron.down")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(Color.secondaryText)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity)
        .background(Color.cardRow)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
}

