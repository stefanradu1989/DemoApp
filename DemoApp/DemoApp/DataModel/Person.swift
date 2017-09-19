//
//  Person.swift
//  DemoApp
//
//  Created by Radu Stefan on 18/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation
import UIKit


// Struct used for capturing data for a Person
struct Person {
    
    var gender: String
    var nameDetails: NameDetails
    var locationDetails: LocationDetails
    var email: String
    var loginDetails: LoginDetails
    var dob: String
    var registered: String
    var phone: String
    var cell: String
    var idDetails: IdDetails
    var pictureUrls: PictureUrls
    var nationality: String
    
    init(gender: String, nameDetails: NameDetails, locationDetails: LocationDetails, email: String, loginDetails: LoginDetails, dob: String, registered: String, phone: String, cell: String, idDetails: IdDetails, pictureUrls: PictureUrls, nationality: String) {
        
        self.gender = gender
        self.nameDetails = nameDetails
        self.locationDetails = locationDetails
        self.email = email
        self.loginDetails = loginDetails
        self.dob = dob
        self.registered = registered
        self.phone = phone
        self.cell = cell
        self.idDetails = idDetails
        self.pictureUrls = pictureUrls
        self.nationality = nationality
    }
}

// Struct used for capturing data for a Person's Name
struct NameDetails {
    
    var title: String
    var first: String
    var last: String
    
    init(title: String, first: String, last: String) {
        
        self.title = title
        self.first = first
        self.last = last
    }
}

// Struct used for capturing data for a Person's Location
struct LocationDetails {
    
    var street: String
    var city: String
    var state: String
    var postcode: NSNumber
    
    init(street: String, city: String, state: String, postcode: NSNumber) {
        
        self.street = street
        self.city = city
        self.state = state
        self.postcode = postcode
    }
}

// Struct used for capturing data for a Person's Login Info
struct LoginDetails {
    
    var username: String
    var password: String
    var salt: String
    var md5: String
    var sha1: String
    var sha256: String
    
    init(username: String, password: String, salt: String, md5: String, sha1: String, sha256: String) {
        
        self.username = username
        self.password = password
        self.salt = salt
        self.md5 = md5
        self.sha1 = sha1
        self.sha256 = sha256
    }
}

// Struct used for capturing data for a Person's ID
struct IdDetails {
    
    var name: String
    var value: String
    
    init(name: String, value: String) {
        
        self.name = name
        self.value = value
    }
}

// Struct used for capturing data for a Person's Photo
struct PictureUrls {
    
    var large: String
    var medium: String
    var thumbnail: String
    
    init(large: String, medium: String, thumbnail: String) {
        
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
}
