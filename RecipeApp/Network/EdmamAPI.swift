//
//  EdmamAPI.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum EdmamAPI {
    
    case search(query: String)
    
    private var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .search:
            return "search"
        }
    }
    
    private var parameters: String {
        var params = [
            "app_id=\(Config.edmamAppId)",
            "app_key=\(Config.edmamAppKey)"
        ]
        switch self {
        case .search(let query):
            let encodedQuery = "r=\(query)"
            params.append(encodedQuery)
        // default: break
        }
        return params.joined(separator: "&")
    }
    
    private var headers: [String : String] {
        let headers = [String:String]()
        return headers
    }
    
    var urlRequest: URLRequest {
        guard let url = URL(string: "\(Config.edmamEndpoint)/\(self.path)\(self.parameters)") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        
        let _ = self.headers.map { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
