//
//  MapaViewController.swift
//  Mapas
//
//  Created by Max Alva on 1/06/18.
//  Copyright © 2018 Max Alva. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    var manager = CLLocationManager()
    var latitudMapa: CLLocationDegrees!
    var longitudMapa: CLLocationDegrees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacion = CLLocationCoordinate2DMake(latitudMapa, longitudMapa)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(localizacion, span)
        self.mapa.setRegion(region, animated: true)
        
        self.mapa.showsUserLocation = true
        
    }

    

}
