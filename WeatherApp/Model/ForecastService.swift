//
//  ForecastService.swift
//  WeatherApp
//
//  Created by Tan Vinh Phan on 12/15/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import Foundation

class ForecastService
{
    let APIKey: String
    let baseURL: URL?
    
    init(APIKey: String) {
        self.APIKey = APIKey
        self.baseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)/")
    }
    
    func getForecast(_ latitude: Double, longtitude: Double, completion: @escaping ((CurrentWeather?) -> Void)) {
        if let forecastURL = URL(string: "\(latitude),\(longtitude)?units=uk", relativeTo: baseURL!)
        {
            let networkProcessing = NetworkProcessing(url: forecastURL)
            
            networkProcessing.downloadJSONFromURL { (jsonDictionary) in
                let currentWeather = getCurrentWeatherFromJSON(jsonDictionary: jsonDictionary)
                completion(currentWeather)
            }
            
        } else {
            print("Error: Found nil in URL")
        }
    }
}

func getCurrentWeatherFromJSON (jsonDictionary: [String : Any]?) -> CurrentWeather? {
    if let jsonDictionary = jsonDictionary {
        let currentWeather = CurrentWeather(jsonDictionary: jsonDictionary)
        return currentWeather
    } else {
        return nil
    }
}



