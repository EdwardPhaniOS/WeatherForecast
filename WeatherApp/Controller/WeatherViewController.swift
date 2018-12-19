//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Tan Vinh Phan on 12/18/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var temperatureScale: UILabel!
    
    let locationManager = LocationManager()
    let APIKey = "0f53c2ed23967cf01dcbbe46212efab9"
    
    var currentWeather: CurrentWeather!
    
    var coordinate: Coordinate! {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.getPermission()
        locationManager.didGetLocation = {
            [weak self] coordinate in self?.coordinate = coordinate
        }
    }
    
    func updateUI() -> Void {
        let forecastService = ForecastService(APIKey: self.APIKey)
        forecastService.getForecast(self.coordinate.latitude, longtitude: self.coordinate.longtitude) { (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async(execute: {
                    self.summaryLabel.text = currentWeather.summary
                    self.cityLabel.text = currentWeather.timezone
                    self.temperatureLabel.text = currentWeather.temperature?.description
                })
            } else {
                self.summaryLabel.text = " "
                self.cityLabel.text = " "
                self.temperatureLabel.text  = " "
                self.temperatureScale.text = " "
            }
        }
    }
}

