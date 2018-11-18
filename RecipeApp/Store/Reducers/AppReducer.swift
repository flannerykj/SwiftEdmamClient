//
//  AppReducer.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter


func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        navigationState: NavigationReducer.handleAction(action, state: state?.navigationState),
        authState: authReducer(action: action, state: state?.authState)
    )
}
