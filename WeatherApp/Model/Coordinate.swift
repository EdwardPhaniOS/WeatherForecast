//
//  Coordinate.swift
//  WeatherApp
//
//  Created by Tan Vinh Phan on 12/15/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import Foundation

struct Coordinate: CustomStringConvertible {
    
    var latitude: Double
    var longtitude: Double
    
    var description: String {
        return "\(latitude), \(longtitude)"
    }
}


