//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Tan Vinh Phan on 12/17/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager : NSObject
{
    let manager = CLLocationManager()
    var didGetLocation : ((Coordinate) -> Void)?
    
    override init() {
        super.init()
        
        manager.delegate = self
       // manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestLocation()
       
    }
    
    func getPermission() -> Void {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
    }
    
}

extension LocationManager : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        if let location = location {
            let coordinate = Coordinate(location: location)
            if let didGetLocation = didGetLocation {
                didGetLocation(coordinate)
            }
        }
    }
}

private extension Coordinate {
    
    init(location: CLLocation) {
        self.latitude = location.coordinate.latitude
        self.longtitude = location.coordinate.longitude
    }
    
}
