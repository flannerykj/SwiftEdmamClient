//
//  AppRouter.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

class NavigationNode {
    let identifier: String
    let controller: Controller
    let parentNode: NavigationNode?
    
    var childNodes: [NavigationNode]?
    var stack: [NavigationNode]?
    
    init(identifier: String, controller: Controller, parentNode: NavigationNode?) {
        self.identifier = identifier
        self.controller = controller
        self.parentNode = parentNode
    }
}

enum Controller: String, CaseIterable {
    case AuthViewController, LoadingViewController
}

// MARK: AppRouter
final class AppRouter {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        store.subscribe(self) {
            $0.select {
                $0.navigationState
            }
        }
        setRoot(controller: .LoadingViewController)
    }
    
    //
    fileprivate func pushViewController(controller: Controller, animated: Bool) {
        let newVC = instantiate(controller: controller)
        /* let newVCType = type(of: newVC)
        let currentVCs = navigationController.viewControllers
        for vc in currentVCs {
            let vcType = type(of: vc)
            if newVCType == vcType {
                // this appears to happen automatically on click back button in nav:
                // navigationController.popToViewController(vc, animated: true)
                return
            }
        } */
        // store.dispatch(navigate: newVC)
        
    }
    
    private func setRoot(controller: Controller) {
        guard let newRoot = instantiate(controller: controller) else { return }
        self.window.rootViewController = newRoot
        self.window.makeKeyAndVisible()
    }
    
    private func instantiate(controller: Controller) -> UIViewController? {
        let vcClassName = "\(Config.appName).\(controller.rawValue)"
        guard let vcClass = NSClassFromString(vcClassName) as? UIViewController.Type else { return nil }
        return vcClass.init()
    }
}

// MARK: - StoreSubscriber
// 3
extension AppRouter: StoreSubscriber {
    func newState(state: NavigationState) {
        
    }
}
