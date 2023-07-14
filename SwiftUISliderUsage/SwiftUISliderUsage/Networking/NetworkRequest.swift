//
//  NetworkRequest.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import Foundation



class NetworkRequest<T: Codable>{
    
    static func requestLoans(url: URL, completionHandler: ((_ model: T) -> Void)?) {
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            // Pars JSON data
            do {
                guard let data = data else { return }
                let model = try JSONDecoder().decode(T.self, from: data)
                
                completionHandler?(model)
                
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}
