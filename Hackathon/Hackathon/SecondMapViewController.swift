////
////  MapViewController.swift
////  Hackathon
////
////  Created by Mohamed Ghribi on 11/10/17.
////  Copyright © 2017 Mohamed Ghribi. All rights reserved.
////
//
//import UIKit
//import MapKit
//import CoreLocation
//
//
//class SecondMapViewController: UIViewController, MKMapViewDelegate {
//    
//
//    
//    @IBOutlet weak var map: MKMapView!
//    @IBOutlet weak var waitLabel: UILabel!
//    @IBOutlet weak var addDest: UIButton!
//    @IBOutlet weak var sourceText: UITextField!
//    @IBOutlet weak var destText: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        let lat: CLLocationDegrees = coor.latitude
//        let long: CLLocationDegrees = coor.longitude
//        let latDelta: CLLocationDegrees = 0.01
//        let longDelta: CLLocationDegrees = 0.01
//        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
//        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: long)
//        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
//        self.map.setRegion(region, animated: true)
//        
//        let annotation = MKPointAnnotation()
//        annotation.title = "Source"
//        annotation.coordinate = coordinates
//        self.map.addAnnotation(annotation)
//        
//        
//        
//    }
//    
//    
//
//    
//    
//    @IBAction func addDest(_ sender: Any) {
//        
//        getCoordinateFrom(address: destText.text!) { coordinate, error in
//            guard let coor = coordinate, error == nil else { return }
//            // don't forget to update the UI from the main thread
//        
//            
//            DispatchQueue.main.async {
//                print(coor) // CLLocationCoordinate2D(latitude: -22.910863800000001, longitude: -43.204543600000001
//             
//                
//            }
//          
//            
//        }
//    }
//
//    
//    
//    
//    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
//        CLGeocoder().geocodeAddressString(address) { placemarks, error in
//            completion(placemarks?.first?.location?.coordinate, error)
//        }
//    }
//    
//    
//    
//    
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    
//    
//}
//
//
