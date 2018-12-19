//
//  NetworkProcessing.swift
//  WeatherApp
//
//  Created by Tan Vinh Phan on 12/15/18.
//  Copyright © 2018 PTV. All rights reserved.
//

import Foundation

class NetworkProcessing
{
    lazy var sessionConfiguration = URLSessionConfiguration.default
    lazy var session = URLSession(configuration: sessionConfiguration)
    let url: URL!
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONHandler = (([String : Any]?) -> Void)
    
    func downloadJSONFromURL(completion: @escaping JSONHandler) -> Void {
        let dataTask = session.dataTask(with:  self.url) { (data, response, error) in
            
            if let error = error as NSError? {
                print("\(error)")
            } else
            {
                if let response = response as? HTTPURLResponse  {
                    switch (response.statusCode)
                    {
                    case 200: //OK
                        do {
                            let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                            completion(jsonDictionary)
                        }   catch let error as NSError {
                            print("\(error)")
                        }
                    default:
                        print("HTTP Response code: \(response.statusCode)")
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
}



