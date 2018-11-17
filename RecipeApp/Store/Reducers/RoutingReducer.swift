//
//  RouterReducer.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import ReSwift


func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    var state = state ?? RoutingState()
    
    // alter state according to the action dispatched
    switch action {
    case let routingAction as RoutingAction:
        state.navigationState = routingAction.destination
    default: break
    }
    
    return state
}
