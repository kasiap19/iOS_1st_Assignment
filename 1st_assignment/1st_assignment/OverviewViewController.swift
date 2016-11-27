//
//  ViewController.swift
//  1st_assignment
//
//  Created by kasia on 27/11/16.
//  Copyright © 2016 kasia. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {
   
    // destination label
    @IBOutlet weak var destinationDate: UILabel!
    // departure date
    @IBOutlet weak var DepartureDate: UILabel!
    // arrival date
    @IBOutlet weak var ArrivalDate: UILabel!
    
     var pointedDestination  = ""
     var departureDateO = ""
    var arrivalDateO = ""
    // save btn
    @IBAction func saveBtn(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "JUHU!", message:
            "Data will be saved in the future! ", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationDate.text! = pointedDestination
        
        //departure date
        DepartureDate.text! = departureDateO
        
        // arrival date
        ArrivalDate.text! = arrivalDateO
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    
    
}





