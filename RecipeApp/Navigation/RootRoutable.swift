//
//  RootRoutable.swift
//  RecipeApp
//
//  Created by Flannery Jefferson on 2018-11-18.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import ReSwiftRouter

class RootRoutable: Routable {
    
    var routable: Routable
    
    init(routable: Routable) {
        self.routable = routable
    }
    
    public func pushRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler
        ) -> Routable {
        completionHandler()
        return self.routable
    }
    
    public func popRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) {
        completionHandler()
    }
    
}
