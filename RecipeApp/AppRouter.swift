//
//  Router.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

import ReSwift

enum RoutingDestination: String {
    case savedRecipes = "SavedRecipesTableViewController"
}

final class AppRouter {
    
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        // 1
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
    }
    
    // 2
    fileprivate func pushViewController(identifier: String, animated: Bool) {
        let newVC = instantiateViewController(identifier: identifier)
        let newVCType = type(of: newVC)
        let currentVCs = navigationController.viewControllers
        for vc in currentVCs {
            let vcType = type(of: vc)
            if newVCType == vcType {
                // this appears to happen automatically on click back button in nav:
                // navigationController.popToViewController(vc, animated: true)
                return
            }
        }
        navigationController.pushViewController(newVC, animated: animated)
    }
    
    private func instantiateViewController(identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: - StoreSubscriber
// 3
extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
        // 4
        let shouldAnimate = navigationController.topViewController != nil
        // 5
        pushViewController(identifier: state.navigationState.rawValue, animated: shouldAnimate)
    }
}
