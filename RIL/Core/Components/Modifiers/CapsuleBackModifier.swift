//
//  CapsuleBackModifier.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 18/4/22.
//

import Foundation
import SwiftUI

struct CapsuleBackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textCase(.uppercase)
            .padding(20)
            .foregroundColor(Color.white)
            .background(
                Capsule()
                    .foregroundColor(Color.theme.accent)
                    .shadow(color: Color.theme.accent.opacity(0.4), radius: 10, x: 2, y: 10)
            )
    }
}

struct CapsuleBackModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .modifier(CapsuleBackModifier())
    }
}
