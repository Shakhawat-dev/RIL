//
//  AlertsRowView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 16/2/22.
//

import SwiftUI

struct AlertsRowView: View {
    var alert: AlertModel?
    
    var body: some View {
        HStack {
            
            Image(systemName: "person")
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(
                    Circle()
                )
                
            VStack(alignment: .leading, spacing: 4.0) {
                if let name = alert?.name {
                    Text(name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                }
                
                Text("Looking for help")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                
                if let number = alert?.number {
                    Text(number)
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                
                if let time = alert?.time {
                    Text(time)
                        .font(.footnote)
                }
                
            }
            
            Spacer(minLength: 0)
            
            VStack {
                NavigationLink {
                    LocationView(alert: alert)
                        .navigationBarHidden(true)
                } label: {
                    Text("View Location")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .textCase(.uppercase)
                }

                
                    
            }
            .frame(width: 96, height: 96, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.theme.accent)
                    
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
