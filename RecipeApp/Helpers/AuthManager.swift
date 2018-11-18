//
//  AuthManager.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()
    
    var accessToken: String?
    var expiresAt: Date?
    
    func getTokenFromKeychain() -> Bool {
        let (token, expiry) = KeychainHelper.getTokenFromKeychain()
        if let token = token, let expiry = expiry {
            if (Date() < expiry) {
                self.accessToken = token
                self.expiresAt = expiry
                print(expiry)
                return true
            }
        }
        return false
    }
    
    func endSession() {
        let success = KeychainHelper.clearAuth()
        if success {
            self.accessToken = nil
            self.expiresAt = nil
            print("successfully logged out")
        }
    }
    func setToken(accessToken: String) {
        self.accessToken = accessToken
        
        /* let jwt = try? decode(jwt: accessToken) // JWTDecode Pod
        r
        if let expiresAt = jwt?.expiresAt {
            let _ = KeychainHelper.setToken(token: accessToken, expires: expiresAt)
            self.expiresAt = expiresAt
        } */
    }
    
    func isAuthenticated() -> Bool {
        if let _ = accessToken, let expires = expiresAt {
            if (Date() < expires) {
                return true
            }
        }
        return false
    }
}
