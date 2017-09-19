//
//  Router.swift
//  DemoApp
//
//  Created by Radu Stefan on 19/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit


protocol Router {
    
    associatedtype RouteType
    
    func route(to route: RouteType,
               from context: UIViewController,
               parameters: Any?)
}

extension Router {
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        
        if let window = UIApplication.shared.delegate?.window {
            
            if !animated {
                window!.rootViewController = rootViewController
            } else {
                UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    
                    let oldState: Bool = UIView.areAnimationsEnabled
                    UIView.setAnimationsEnabled(false)
                    window!.rootViewController = rootViewController
                    UIView.setAnimationsEnabled(oldState)
                    
                }, completion: { (finished: Bool) -> Void in
                    if completion != nil {
                        completion!()
                    }
                })
            }
        }
    }
}

// Storyboard Identifiers
enum StoryboardId: String {
    case main = "MainStoryboard"
}

// View Controller Identifiers
enum ViewControllerId: String {
    case listVc = "ListScreenViewControllerId"
    case detailVc = "DetailScreenViewControllerId"
}

// Segue Identifiers
enum SegueId: String {
    case listToDetail = "listToDetailSegueId"
}
