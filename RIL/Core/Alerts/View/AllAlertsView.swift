//
//  AllAlertsView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 19/4/22.
//

import SwiftUI

struct AllAlertsView: View {
    @StateObject var vm = AllAlertsViewModel()
    
    let list = Array(0...20)
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ForEach(list, id: \.self) { _ in
                        AlertsRowView()
                    }
                }
                .padding()
            }
        }
    }
}

struct AllAlertsView_Previews: PreviewProvider {
    static var previews: some View {
        AllAlertsView()
    }
}
