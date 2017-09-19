//
//  ListScreenRouter.swift
//  DemoApp
//
//  Created by Radu Stefan on 19/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit


class ListScreenRouter {
    typealias RouteType = Route
    
    enum Route: String {
        case detail
    }
    
    func route(to route: RouteType, from context: UIViewController, parameters: Any? = nil) {
        let bundle = Bundle(for: type(of: self))
        
        switch route {
        case .detail:
            let storyboard = UIStoryboard.init(name: StoryboardId.main.rawValue, bundle: bundle)
            let newVC = storyboard.instantiateViewController(withIdentifier: ViewControllerId.detailVc.rawValue)
            context.navigationController?.pushViewController(newVC, animated: true)
        }
    }
}
