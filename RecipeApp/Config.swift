//
//  Config.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

struct Config {
    
    // Get the file path for keys.plist
    private static let filePath = Bundle.main.path(forResource: "Keys", ofType: "plist")
    private static let plist = NSDictionary(contentsOfFile: Config.filePath!)
    
    // public config constants
    static let edmamEndpoint = "https://api.edamam.com"
    static let edmamAppId = plist?.object(forKey: "EDMAM_APP_ID") as! String
    static let edmamAppKey = plist?.object(forKey: "EDMAM_API_KEY") as! String
}
