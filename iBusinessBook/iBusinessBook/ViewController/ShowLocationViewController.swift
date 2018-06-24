//
//  ShoeLocationViewController.swift
//  iBusinessBook
//
//  Created by Kevin Tito on 6/23/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ShowLocationViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let locationLocal = LocationRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLocationManager()
        setupMapKit()
        showSavedLocation()
    }

}
extension ShowLocationViewController: CLLocationManagerDelegate{
    func setupLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            updateMapView(for: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("Location error: \(error.localizedDescription)")
    }
}

extension ShowLocationViewController: MKMapViewDelegate{
    func setupMapKit(){
        self.mapView.delegate = self
        self.mapView.mapType = .standard
        self.mapView.isZoomEnabled = true
        self.mapView.showsUserLocation = true
        self.mapView.showsScale = true
        self.mapView.showsCompass = true
        self.mapView.showsPointsOfInterest = true
        self.mapView.showsTraffic = true
        self.mapView.showsBuildings = true
    }
    func updateMapView(for location: CLLocation) {
        let delta = 0.005
        self.mapView.setRegion(
            MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpanMake(delta, delta)), animated: true)
        NSLog("latitude: \(location.coordinate.latitude)")
        NSLog("longitede: \(location.coordinate.longitude)")
        NSLog("altitude: \(location.altitude)")
    }
    
    func showSavedLocation() {
        if locationLocal.hasSavedLocation{
            if let location = locationLocal.savedLocation{
                let annotation = MKPointAnnotation()
                annotation.coordinate = location.coordinate
                annotation.title = "Local Location"
                annotation.subtitle = "\(location.coordinate.latitude), \(location.coordinate.longitude)"
                self.mapView.addAnnotation(annotation)
            }
        }
    }
}
