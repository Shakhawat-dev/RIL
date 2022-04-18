//
//  RoundedButtonView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 18/4/22.
//

import SwiftUI

struct RoundedButtonView: View {
    var title: String
    
    var body: some View {

            HStack {
                Spacer()
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .frame(width: 248)
            .modifier(CapsuleBackModifier())
        }
}

struct RoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButtonView(title: "Login")
    }
}
