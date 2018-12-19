//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Tan Vinh Phan on 12/15/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import Foundation

class CurrentWeather {
    
    let temperature: Double?
    let timezone: String?
    let summary: String?
    
    private struct JSONDictionaryKey {
        static let currently = "currently"
        static let temperature = "temperature"
        static let summary = "summary"
        static let timezone = "timezone"
    }
    
    init(jsonDictionary: [String : Any]?) {
        if let jsonDictionary = jsonDictionary {
            if let currentWeather = jsonDictionary[JSONDictionaryKey.currently] as? [String : Any]
            {
                self.temperature = currentWeather[JSONDictionaryKey.temperature] as? Double
                self.summary = currentWeather[JSONDictionaryKey.summary] as? String
            } else {
                self.temperature = nil
                self.summary = nil
            }
            
            self.timezone = jsonDictionary[JSONDictionaryKey.timezone] as? String
            
        } else
        {
            self.temperature = nil
            self.timezone = nil
            self.summary = nil
        }
    }
}


