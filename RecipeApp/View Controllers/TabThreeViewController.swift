//
//  TabThreeViewController.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter

class TabThreeViewController: UIViewController, StoreSubscriber, Routable {
    
    static let identifier = "TabThreeViewController"
    
    var infoViewController: Routable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        // counterLabel.text = "\(state.counter)"
    }
    
    func pushRouteSegment(_ viewControllerIdentifier: RouteElementIdentifier,
                          animated: Bool,
                          completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        
        infoViewController = TabTwoViewController()
        
        present(infoViewController as! UIViewController, animated: false,
                completion: completionHandler)
        
        return infoViewController
    }
    
    func popRouteSegment(_ identifier: RouteElementIdentifier,
                         animated: Bool,
                         completionHandler: @escaping RoutingCompletionHandler) {
        
        dismiss(animated: false, completion: completionHandler)
    }
    
    func pushButtonTapped(_ sender: Any) {
        _ = mainStore.dispatch(
            SetRouteAction(["TabBarViewController", TabThreeViewController.identifier,
                            TabThreeViewController.identifier])
        )
    }
    
}
