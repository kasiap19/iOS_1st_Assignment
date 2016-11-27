//
//  ViewController.swift
//  1st_assignment
//
//  Created by kasia on 27/11/16.
//  Copyright © 2016 kasia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,UISearchBarDelegate, CLLocationManagerDelegate {
    var LocationManager = CLLocationManager()
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    // search
    @IBAction func showSearchbar(_ sender: AnyObject) {
   
   
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    
     }
    
    var searchController:UISearchController!
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        //1
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0]
            self.mapView.removeAnnotation(annotation)
            
        }
        //2
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "Place Not Found", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            //3
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
            
            self.destinationLabel.text! = searchBar.text!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDate"
        {
            if let destinationVC = segue.destination as? DateViewController {
                destinationVC.pointedDestination =  destinationLabel.text!
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
            LocationManager = CLLocationManager()
            LocationManager.delegate = self
            LocationManager.desiredAccuracy = kCLLocationAccuracyBest
            LocationManager.requestAlwaysAuthorization()
            LocationManager.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [AnyObject]!) {
        let location  = locations.last as! CLLocation!
        
        let center = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
        
        let region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(1, 1))
        
        self.mapView.setRegion(region, animated: true)
        self.LocationManager.stopUpdatingLocation()

    }



}

