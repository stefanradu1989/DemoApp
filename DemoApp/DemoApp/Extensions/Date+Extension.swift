//
//  Date+Extension.swift
//  DemoApp
//
//  Created by Radu Stefan on 18/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation


extension Date {
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
    
    func calculateAgeFromDob(year: Int, month: Int, day: Int) -> Int {
        let dob = Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
        
        return dob.age
    }
}

