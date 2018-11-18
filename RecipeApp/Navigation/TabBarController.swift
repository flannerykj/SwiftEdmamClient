//
//  TabBarController.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-18.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import ReSwiftRouter

class TabBarController: UITabBarController {

    var tabOneVC: TabOneViewController!
    var tabTwoVC: TabTwoViewController!
    var tabThreeVC: TabThreeViewController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabOneVC = TabOneViewController()
        tabTwoVC = TabTwoViewController()
        tabThreeVC = TabThreeViewController()
        
        viewControllers = [tabOneVC, tabTwoVC, tabThreeVC]
        
        tabOneVC.tabBarItem = UITabBarItem(title: "One", image: nil, selectedImage: nil)
        tabTwoVC.tabBarItem = UITabBarItem(title: "Two", image: nil, selectedImage: nil)
        tabThreeVC.tabBarItem = UITabBarItem(title: "Three", image: nil, selectedImage: nil)
        
        mainStore.dispatch { state, store in
            if state.navigationState.route == [] {
                return SetRouteAction(["TabBarViewController", TabOneViewController.identifier])
            } else {
                return nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController is TabOneViewController {
            mainStore.dispatch(
                SetRouteAction(["TabBarViewController", TabOneViewController.identifier])
            )
        } else if viewController is TabThreeViewController {
            mainStore.dispatch(
                SetRouteAction(["TabBarViewController", TabThreeViewController.identifier])
            )
        }
        
        return false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AppDelegate: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController is TabOneViewController {
            mainStore.dispatch(
                SetRouteAction(["TabBarViewController", TabOneViewController.identifier])
            )
        } else if viewController is TabThreeViewController {
            mainStore.dispatch(
                SetRouteAction(["TabBarViewController", TabThreeViewController.identifier])
            )
        }
        
        return false
    }
    
}

extension UITabBarController: Routable {
    
    public func changeRouteSegment(_ fromSegment: RouteElementIdentifier,
                                   to: RouteElementIdentifier,
                                   animated: Bool,
                                   completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        if (to == TabOneViewController.identifier) {
            selectedIndex = 0
            completionHandler()
            return viewControllers![0] as! Routable
        } else if (to == TabThreeViewController.identifier) {
            selectedIndex = 1
            completionHandler()
            return viewControllers![1] as! Routable
        }
        
        abort()
    }
    
    public func pushRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        if (routeElementIdentifier == TabOneViewController.identifier) {
            selectedIndex = 0
            completionHandler()
            return viewControllers![0] as! Routable
        } else if (routeElementIdentifier == TabThreeViewController.identifier) {
            selectedIndex = 1
            completionHandler()
            return viewControllers![1] as! Routable
        }
        
        abort()
    }
    
    public func popRouteSegment(_ viewControllerIdentifier: RouteElementIdentifier,
                                animated: Bool,
                                completionHandler: @escaping RoutingCompletionHandler) {
        // would need to unset root view controller here
        completionHandler()
    }
    
}
