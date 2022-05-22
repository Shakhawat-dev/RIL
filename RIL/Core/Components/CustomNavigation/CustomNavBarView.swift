//
//  CustomNavBar.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 16/2/22.
//

import SwiftUI

struct CustomNavBarView<Content: View>: View {
    let content: Content
    @State var hideBackButton: Bool = false

    @Environment(\.presentationMode) var presentationMode
    
    
    init(@ViewBuilder content: ()-> Content) {
        self.content = content()
    }
    
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                if !hideBackButton {
                    backButton
                }
                Spacer(minLength: 0)
                titleSection

                
                Spacer(minLength: 0)
                
                if !hideBackButton {
                    backButton
                        .hidden()
                }
            }
            .padding(.vertical, 8)
            .foregroundColor(Color.white)
            .background(
                Color.theme.accent.ignoresSafeArea(edges: .top)
            )
            
            content
        }

    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView {
                Image("logo_with_trans")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                    
            }
            Spacer()
        }
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.backward")
                .padding(.horizontal)
                .padding(.vertical, 10)
        }

        
    }
    
    private var titleSection: some View {
        VStack(spacing: 4.0) {
//            content
            
            Image("logo_with_trans")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
            
        }
    }
}
