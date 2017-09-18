//
//  ViewController.swift
//  DemoApp
//
//  Created by Radu Stefan on 17/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit


class ListScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var viewModel: ListScreenViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ListScreenViewModel()
        
        viewModel.getDataForPage(page: "0")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listScreenTableViewCell", for: indexPath) as! ListScreenTableViewCell
        
        // Configure the cell...
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.resultList.count
    }
}
