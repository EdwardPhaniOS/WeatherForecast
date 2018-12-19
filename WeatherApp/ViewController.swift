//
//  ViewController.swift
//  WeatherApp
//
//  Created by Tan Vinh Phan on 12/15/18.
//  Copyright © 2018 PTV. All rights reserved.
//
//https://api.darksky.net/forecast/0f53c2ed23967cf01dcbbe46212efab9/37.8267,-122.4233

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let locationManager = LocationManager()
        locationManager.getPermission()
        
    }
}


