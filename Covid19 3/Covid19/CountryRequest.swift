//
//  CountryRequest.swift
//  Covid19
//
//  Created by Charan Ramachandran on 4/24/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import Foundation


struct CountryRequest {
    let resourceURL:URL

    init(countryCode:String) {
        
        let resourceString = "https://api.covid19api.com/country/india/status/confirmed"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getCountry (completion: @escaping(Result<[CountryInfo], Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in do {
            
            
            guard let jsonData = data else {
                completion(.failure(.noDataValailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countryResponse = try decoder.decode(CountryResponse.self, from: jsonData)
                let countryDetails = countryResponse.response,country
                completion(.success(countryDetails))
            } catch {
                completion(.failure(.caNotProcessData))
            }
        }
        dataTask.resume()
    }
    }
}
