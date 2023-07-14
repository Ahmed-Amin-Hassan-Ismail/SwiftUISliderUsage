//
//  NetworkRequest.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import Foundation



class NetworkRequest {
    
    static func requestLoans<T: Decodable>(model: T, url: URL) {
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            // Pars JSON data
            do {
                guard let data = data else { return }
                let decoder = try JSONDecoder().decode(T.self, from: data)
                print(decoder)
                
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}
