//
//  ViewController.swift
//  1st_assignment
//
//  Created by kasia on 27/11/16.
//  Copyright © 2016 kasia. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    // departure
    @IBOutlet weak var departureDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func datepickerAction(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.string(from: datePicker.date)
        self.departureDate.text = strDate
    }
    // arrival
    @IBOutlet weak var arrivalDate: UILabel!
    @IBOutlet weak var arrivalPicker: UIDatePicker!
    @IBAction func arrivalAction(_
        sender: AnyObject) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let strDate = dateFormatter.string(from: arrivalPicker.date)
            self.arrivalDate.text = strDate
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}
    
    
    


