//
//  AuthViewController.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("loading auth contorller")
        let title = UITextField(frame: CGRect(x: 0, y: 100, width: 200, height: 80))
        title.text = "Hello"
        view.addSubview(title)
        // Do any additional setup after loading the view.
    }

}
