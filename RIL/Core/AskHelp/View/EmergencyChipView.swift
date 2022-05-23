//
//  EmergencyChipView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 23/5/22.
//

import SwiftUI

struct EmergencyChipView: View {
    var image: String
    var title: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            
            Text(title)
                .font(.subheadline)
                .bold()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(isSelected ? Color.theme.accent : .white)
        )
    }
}

struct EmergencyChipView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyChipView(image: "accident", title: "Accident", isSelected: true)
    }
}
