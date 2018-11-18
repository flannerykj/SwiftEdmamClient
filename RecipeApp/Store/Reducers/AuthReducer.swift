//
//  AuthReducer.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import ReSwift

func authReducer(action: Action, state: AuthState?) -> AuthState {
    var state = state ?? AuthState()
    switch action {
    case _ as LoginSuccessAction:
        state.isAuthenticated = true
    default: break
    }
    return state
}
