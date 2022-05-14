//
//  MapView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 14/5/22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @ObservedObject private var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        
        let map = MKMapView()

        map.showsUserLocation = true
        map.delegate = context.coordinator
        
        
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
