//
//  RouterState.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import ReSwift

struct NavigationState: StateType {
    var rootNode: NavigationNode
    var currentNode: NavigationNode
    var inTransition: Bool
    
    init() {
        
        let vc = NavigationNode(identifier: "LoadingScreen", controller: .LoadingViewController, parentNode: nil)
        print("initting vc \(vc)")
        self.rootNode = vc
        self.currentNode = vc
        self.inTransition = false
    }
}





