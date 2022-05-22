//
//  LocationView.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 22/5/22.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @ObservedObject private var vm = HomeViewModel()
    var alert: AlertModel?
    
    var body: some View {
        ZStack {
            CustomNavBarView {
                VStack {
                    if let alert = alert {
                        VStack {
                            Map(coordinateRegion: $vm.mapRegion, showsUserLocation: true, annotationItems: [alert]) { location in
                                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(location.lat ?? "0") ?? 0, longitude: Double(location.lon ?? "0") ?? 0) ) {
                                    Text("Hello")
                                }
                            }
                            
                            VStack {
                                
                            }
                        }
                        
                    }
                    
                }
            }
        }
        .onAppear {
            vm.checkIfLocationServiceIsEnabled()  
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(alert: AlertModel(lat: "20.0", lon: "21.0", name: "", number: "", postid: "", sosCat: "", sosImage: "", sosMsg: "", time: "", uid: "", userImage: ""))
    }
}
