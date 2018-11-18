//
//  AppReducer.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import ReSwift

func appReducer(action: Action, appState: AppState?) -> AppState {
  return AppState(
    navigationState: navigationReducer(action: action, state: appState?.navigationState)
    )
}
