
//
//  ViewController.swift
//  DiagnosticTool
//
//  Created by Dan Dorner on 6/3/16.
//  Copyright © 2016 Daniel Dorner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    var salesToday = "0"
    var salesYesterday = ""
    var inventory = ""
    var yearHigh = ""
    var yearLow = ""
    var percentChanged = 0
    
    
    @IBOutlet weak var salesTodayOutlet: UILabel!
    @IBOutlet weak var salesYesterdayOutlet: UILabel!
    @IBOutlet weak var percentChangedOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = NSBundle.mainBundle().pathForResource("SalesData", ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    
                    salesToday = "$"+jsonObj["list"]["resources"][0]["resource"]["fields"]["todays_sales"].string!
                    salesYesterday = "$"+jsonObj["list"]["resources"][0]["resource"]["fields"]["yesterdays_sales"].string!
                  //  percentChanged = jsonObj["list"]["resources"][0]["resource"]["fields"]["chg_percent"].string!+"%"

                   print(salesToday)
                    
                    
                } else {
                    print("could not get json from file, make sure that file contains valid json.")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        
        
        salesTodayOutlet.text = salesToday
        salesYesterdayOutlet.text = salesYesterday
        
        let a:Int? = Int(salesToday)     // firstText is UITextField
        let b:Int? = Int(salesYesterday)
        
       // percentChanged = (((b!-a!)/b!)*100)
        
        
        percentChangedOutlet.text = String(percentChanged)
        
        
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

