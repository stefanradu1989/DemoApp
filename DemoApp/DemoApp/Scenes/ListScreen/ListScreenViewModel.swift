//
//  ListScreenViewModel.swift
//  DemoApp
//
//  Created by Radu Stefan on 17/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation
import UIKit


class ListScreenViewModel {
    
    // list of persons received trough network call
    var lastPageLoaded: Int
    var resultList: [Person]
    var onFinishedDownloadingData: ((Void) -> ())?
    
    
    init() {
        resultList = []
        lastPageLoaded = 0
    }
    
    
    // MARK: - Fetch Data
    
    func getDataForPage(page: Int) {
        
        let completionHandler: ([Person]?, Error?) -> Void = { value, error in
            if let value = value {
                if value.count > 0 {
                    self.resultList = value
                    self.onFinishedDownloadingData?()
                }
            } else {
                print(error!.localizedDescription)
            }
        }
        
        NetworkManager.instance.getData(page: page, results: Constants.Results.value, completionHandler: completionHandler)
    }
}
