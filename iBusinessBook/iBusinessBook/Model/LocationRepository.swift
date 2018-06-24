//
//  LocationRepository.swift
//  iBusinessBook
//
//  Created by Kevin Tito on 6/24/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import Foundation
import CoreLocation

class LocationRepository{
    let locationLocal = UserDefaults.standard
    
    var savedLocation: CLLocation?{
        get {
            let latitude = locationLocal.double(forKey: "savedLatitud")
            let longitude = locationLocal.double(forKey: "savedLongitude")
            if latitude == 0 && longitude == 0{
                return nil
            }
            return CLLocation(latitude: latitude, longitude: longitude)
        }
        set {
            if let location = newValue as CLLocation?{
                locationLocal.set(location.coordinate.latitude, forKey: "savedLatitude")
                locationLocal.set(location.coordinate.longitude, forKey: "savedLongitude")
                return
            }
            locationLocal.removeObject(forKey: "savedLatitude")
            locationLocal.removeObject(forKey: "savedLongitude")
        }
    }
    var hasSavedLocation: Bool{
        return self.savedLocation != nil
    }
}
