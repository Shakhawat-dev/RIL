//
//  HomeViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 10/5/22.
//

import Foundation
import SwiftUI
import CoreLocation

class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocation!
    @Published var userAddress = ""
    @Published var noLocation = false
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Checking Location Access...
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("authorized")
            self.noLocation = false
            manager.requestLocation()
        case .denied:
            print("denied")
            self.noLocation = true
        default:
            print("unknown")
            self.noLocation = false
            locationManager.requestWhenInUseAuthorization()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.last
    }
    
    func extractLocation() {
        CLGeocoder().reverseGeocodeLocation(self.userLocation) { res, err in
            guard let safeData = res else { return }
            
            var address = ""
            
            address += safeData.first?.name ?? ""
            address += ","
            address += safeData.first?.locality ?? ""
            
            self.userAddress = address
        }
    }
}
