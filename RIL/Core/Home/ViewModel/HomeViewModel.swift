//
//  HomeViewModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 10/5/22.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 23.790552, longitude: 90.391769)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var locationManager: CLLocationManager?
    
    @Published var userLocation: CLLocation!
    @Published var userAddress = ""
    @Published var noLocation = false
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Show an alert letting them know location service is off")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parantal control")
        case .denied:
            print("Location authorization denied")
        case .authorizedAlways, .authorizedWhenInUse:
            guard let location = locationManager.location else {
                return
            }
            
            mapRegion = MKCoordinateRegion(center: location.coordinate, span: MapDetails.defaultSpan)
            break
        @unknown default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Checking Location Access...
        /*
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
            locationManager?.requestWhenInUseAuthorization()
            
        }
         */
        
        checkLocationAuthorization()
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
