//
//  AuthState.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import ReSwift


struct AuthState: StateType {
    var isAuthenticated: Bool
    
    init() {
        isAuthenticated = false
    }
}
