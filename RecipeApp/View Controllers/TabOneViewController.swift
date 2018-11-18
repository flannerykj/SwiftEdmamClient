//
//  TabOneViewController.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter

class TabOneViewController: UIViewController, StoreSubscriber, Routable {
    
    static let identifier = "TabOneViewController"
    
    var textField: UITextField = {
        let field = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        field.text = TabOneViewController.identifier
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(textField)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("tab one will appear")
        mainStore.subscribe(self)   
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        print("new state from tab one: \(state)")
    }

    
}
