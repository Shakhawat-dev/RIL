//
//  MenuItemView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 13/5/22.
//

import SwiftUI

struct MenuItemView: View {
    var title: String
    var icon: String
    var isSystem: Bool = false
    
    var body: some View {
        HStack {
            Label {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            } icon: {
                VStack {
                    if isSystem {
                        Image(systemName: icon).resizable()
                            .scaledToFit()
                    } else {
                        Image(icon)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            
                    }
                    
                }
                .frame(width: 18, height: 18, alignment: .center)
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .padding(8)
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(title: "Hello", icon: "person", isSystem: true)
            .previewLayout(.sizeThatFits)
    }
}
