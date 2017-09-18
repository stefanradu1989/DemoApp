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
                completionHandler(self.parseData(data: value as AnyObject), nil)
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
    
    func parseData(data: AnyObject) -> [Person] {
        
        var list: [Person] = []
        return list
    }
}
