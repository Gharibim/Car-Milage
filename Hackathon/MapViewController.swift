//
//  MapViewController.swift
//  Hackathon
//
//  Created by Mohamed Ghribi on 11/10/17.
//  Copyright © 2017 Mohamed Ghribi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var myMap: MKMapView!
    var myRoute : MKRoute?
    let directionsRequest = MKDirectionsRequest()



    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var waitLabel: UILabel!
    @IBOutlet weak var addDest: UIButton!
    @IBOutlet weak var destText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lat: CLLocationDegrees = 39.034021
        let long: CLLocationDegrees = -94.577099
        let latDelta: CLLocationDegrees = 0.06
        let longDelta: CLLocationDegrees = 0.06
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Source"
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
        
        
       let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        
        
       
        
        
    }
    
    
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer){
        if gestureRecognizer.state == .ended {
            let touchPoint = gestureRecognizer.location(in: self.map)
            let coordinates = map.convert(touchPoint, toCoordinateFrom: self.map)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = "Destination"
            map.addAnnotation(annotation)

            let source = CLLocation(latitude: 39.034021, longitude: -94.577099)

            let distination = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)



            let distanceInMeters = source.distance(from: distination)
            let distanceInMiles = String(Int(distanceInMeters/1609.344))

            myArrayDataStructure.myArray.append(distanceInMiles)
            UserDefaults.standard.set(myArrayDataStructure.myArray, forKey: "items")
            waitLabel.text = "Distance was added to mileage"
            waitLabel.textColor = UIColor.gray

        }
    }
    
    
    @IBAction func addDest(_ sender: Any) {
        getCoordinateFrom(address: destText.text!) { coordinate, error in
            guard let coor = coordinate, error == nil else { return }
            // don't forget to update the UI from the main thread
            DispatchQueue.main.async {
                print(coor) // CLLocationCoordinate2D(latitude: -22.910863800000001, longitude: -43.204543600000001)
                let sou = CLLocation(latitude: 39.034021, longitude: -94.577099)
                let dest = CLLocation(latitude: coor.latitude, longitude: coor.longitude)
                let distanceInMeters = sou.distance(from: dest)
                let distanceInMiles = String(Int(distanceInMeters/1609.344 ))
                
                
                let markFirstPoint = MKPlacemark(coordinate: CLLocationCoordinate2DMake(39.034021, -94.577099), addressDictionary: nil)
                let markSecondPoint = MKPlacemark(coordinate: CLLocationCoordinate2DMake((coor.latitude), (coor.longitude)), addressDictionary: nil)
                
                
                
                
                
                
                
                
                
                
//                self.directionsRequest.source = MKMapItem(placemark: markSecondPoint)
//                self.directionsRequest.destination = MKMapItem(placemark: markFirstPoint)
//                self.directionsRequest.transportType = MKDirectionsTransportType.automobile
//                let directions = MKDirections(request: self.directionsRequest)
//                directions.calculate { (response:MKDirectionsResponse!, error: Error!) -> Void in
//                    if error == nil {
//                        self.myRoute = response.routes[0] as MKRoute
//                        self.myMap.add((self.myRoute?.polyline)!)
//                    }
//                }

                
                myArrayDataStructure.myArray.append(distanceInMiles)
                UserDefaults.standard.set(myArrayDataStructure.myArray, forKey: "items")
                self.waitLabel.text = "Distance was added to mileage"
                self.waitLabel.textColor = UIColor.gray
                
                
            }
            
        }
    }
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { placemarks, error in
            completion(placemarks?.first?.location?.coordinate, error)
        }
    }
   
    
     func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        let myLineRenderer = MKPolylineRenderer(polyline: (myRoute?.polyline)!)
        myLineRenderer.strokeColor = UIColor.red
        myLineRenderer.lineWidth = 3
        return myLineRenderer
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

