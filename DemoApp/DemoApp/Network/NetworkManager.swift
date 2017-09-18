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
    
    func getData(page: String, results: String) {
        getDataCall(page: page, results: results)
    }
    
    private func getDataCall(page: String, results: String) {
        let url = createDataUrl(page: page, results: results)
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                (results: value as! [AnyObject])
            case .failure(let error):
                print("Error while making data request \n Error: \(error.localizedDescription)")
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
}
