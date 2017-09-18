//
//  ListScreenViewModel.swift
//  DemoApp
//
//  Created by Radu Stefan on 17/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation


class ListScreenViewModel {
    
    // list of persons received trough network call
    var resultList: [Person]
    
    init() {
        resultList = []
    }
    
    
    // MARK: Fetch Data
    
    func getDataForPage(page: String) {
        
        let completionHandler: ([Person]?, Error?)->Void = { value, error in
            if error != nil {
                self.resultList = value!
            } else {
                print(error!.localizedDescription)
            }
        }
        
        NetworkManager.instance.getData(page: page, results: Constants.Results.value, completionHandler: completionHandler)
    }
}
