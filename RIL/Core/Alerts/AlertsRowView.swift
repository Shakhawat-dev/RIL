//
//  AlertsRowView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 16/2/22.
//

import SwiftUI

struct AlertsRowView: View {
    var body: some View {
        HStack {
            
            Image(systemName: "person")
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(
                    Circle()
                )
                
            VStack(alignment: .leading, spacing: 4.0) {
                Text("Hello, World!")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                
                Text("Looking for help")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                
                Text("01910313813")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Text("09:47 PM 05/02/2022")
                    .font(.footnote)
            }
            
            Spacer(minLength: 0)
            
            VStack {
                Text("View Location")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    
            }
            .frame(width: 96, height: 96, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.green)
            )
        }
    }
}

struct AlertsRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlertsRowView()
            .previewLayout(.sizeThatFits)
    }
}
