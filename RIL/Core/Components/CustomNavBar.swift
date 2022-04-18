//
//  CustomNavBar.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 16/2/22.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .font(.title)
                .padding()
            
            Spacer(minLength: 0)
            
            Image(systemName: "line.3.horizontal")
                .font(.title)
                
            Spacer(minLength: 0)
            
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 48, height: 48)
                .padding(.vertical, 8)
                .padding(.trailing)
        }
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar()
            .previewLayout(.sizeThatFits)
    }
}
