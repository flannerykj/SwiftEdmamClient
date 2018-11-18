//
//  KeychainHelper.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper


struct AuthKeychain: Codable {
    var token: String
    var tokenExpires: Date
}

struct KeychainHelper {
    static func setToken(token: String, expires: Date) -> Bool {
        let auth = AuthKeychain(token: token, tokenExpires: expires)
        
        if let codedAuth = try? JSONEncoder().encode(auth) {
            let saved: Bool = KeychainWrapper.standard.set(codedAuth, forKey: "auth")
            if saved {
                return true
            } else {
                print("NOT SAVED")
            }
        } else {
            print("COULDNT ENCODE EXPIRY DATE")
        }
        return false
    }
    
    public static func getTokenFromKeychain() -> (String?, Date?) {
        if let auth = KeychainWrapper.standard.string(forKey: "auth") {
            if let data = auth.data(using: .utf8) {
                if let decodedAuth = try? JSONDecoder().decode(AuthKeychain.self, from: data) {
                    return (decodedAuth.token, decodedAuth.tokenExpires)
                } else {
                    print("couldn't decode")
                    return (nil, nil)
                }
            } else {
                print ("couldnt conver to data")
                return (nil, nil)
            }
        } else {
            print("couldn't get auth date from keychain")
            return (nil, nil)
        }
    }
    
    public static func clearAuth() -> Bool {
        if let _ = KeychainWrapper.standard.string(forKey: "auth") {
            let success = KeychainWrapper.standard.removeObject(forKey: "auth")
            if success {
                return true
            }
        }
        return false
    }
    
    
}
