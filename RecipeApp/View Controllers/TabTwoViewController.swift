//
//  TabTwoViewController.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

import UIKit
import ReSwift
import ReSwiftRouter

class TabTwoViewController: UIViewController, StoreSubscriber, Routable {
    
    static let identifier = "TabTwoViewController"
    
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

    
}
