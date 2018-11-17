//
//  NetworkManager.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation



class NetworkManager {
    static let shared = NetworkManager()
    
    func makeRequest(request: URLRequest, completion: @escaping (Bool, Error?, Data?) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        session.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                print("request error")
                completion(false, error, data)
            } else {
                completion(true, nil, data)
            }
            }.resume()
    }
}
