//
//  NetworkManager.swift
//  DemoApp
//
//  Created by Radu Stefan on 18/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Alamofire
import AlamofireImage
import SwiftyJSON
import Foundation


class NetworkManager {
    
    // Create Singleton Instance
    static let instance = NetworkManager()
    private init() {}
    
    /*
     * Method used to create desired URL for data fetch
     */
    func createDataUrl(page: String, results: String) -> String {
        return "https://randomuser.me/api/?page=\(page)&results=\(results)&seed=abc"
    }
    
    
    // MARK: - Data List
    
    func getData(page: String, results: String, completionHandler: @escaping ([Person]?, Error?) -> ()) {
        getDataCall(page: page, results: results, completionHandler: completionHandler)
    }
    
    func getDataCall(page: String, results: String, completionHandler: @escaping ([Person]?, Error?) -> ()) {
        let url = createDataUrl(page: page, results: results)
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonResponse = JSON(value)
                completionHandler(self.parseData(json: jsonResponse), nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    
    // MARK: - Photos
    
    func getPhoto(imageurl: String, completionHandler: @escaping (UIImage?, Error?) -> ()) {
        
        Alamofire.request(imageurl).responseImage { response in
            switch response.result{
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    
    // MARK: - Parse Data
    
    func parseData(json: JSON) -> [Person] {
        
        var list: [Person] = []
        
        for person in json["results"].array! {
            
            let personName = person["name"] as JSON
            let nameDetails = NameDetails(title: personName["title"].stringValue, first: personName["first"].stringValue, last: personName["last"].stringValue)
            
            let personLocation = person["location"] as JSON
            let locationDetail = LocationDetails(street: personLocation["street"].stringValue, city: personLocation["city"].stringValue, state: personLocation["state"].stringValue, postcode: personLocation["postcode"].numberValue)
            
            let personLoginInfo = person["login"] as JSON
            let loginDetails = LoginDetails(username: personLoginInfo["username"].stringValue, password: personLoginInfo["password"].stringValue, salt: personLoginInfo["salt"].stringValue, md5: personLoginInfo["md5"].stringValue, sha1: personLoginInfo["sha1"].stringValue, sha256: personLoginInfo["sha256"].stringValue)
            
            let personId = person["id"] as JSON
            let idDetail = IdDetails(name: personId["name"].stringValue, value: personId["value"].stringValue)
            
            let personPicture = person["picture"] as JSON
            let pictureUrls = PictureUrls(large: personPicture["large"].stringValue, medium: personPicture["medium"].stringValue, thumbnail: personPicture["thumbnail"].stringValue)
            
            let personListItem = Person(gender: person["gender"].stringValue, namedetails: nameDetails, locationDetails: locationDetail, email: person["email"].stringValue, loginDetails: loginDetails, dob: person["dob"].stringValue, registered: person["registered"].stringValue, phone: person["phone"].stringValue, cell: person["cell"].stringValue, idDetails: idDetail, pictureUrls: pictureUrls, nationality: person["nat"].stringValue)
            
            list.append(personListItem)
        }
        
        return list
    }
}
