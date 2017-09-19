//
//  Constants.swift
//  DemoApp
//
//  Created by Radu Stefan on 18/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation


enum Constants {
    
    case Results
    case LastPage
    
    var value: Int {
        switch self {
        case .Results:
            return 100
        case .LastPage:
            return 2
        }
    }
    
}
