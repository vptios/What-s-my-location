//
//  ViewController.swift
//  WhatsMyLocation
//
//  Created by Ameya Vichare on 17/05/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        
        // api call here
        
        Alamofire.request("https://freegeoip.net/json/", method: .get).responseJSON { (response) in
            
            switch response.result {
                
            case .success( _):
                print("success")
                print(response.result.value!)
                
                let json = JSON(response.result.value!)
                
                let city = json["city"].stringValue
                let state = json["region_name"].stringValue
                
                self.location.text = "You live in " + city + ", " + state
                
                
            case .failure( _):
                print("failure")
            }
        }
    }

}

