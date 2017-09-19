//
//  DetailScreenViewController.swift
//  DemoApp
//
//  Created by Radu Stefan on 19/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    var person: Person!
    
    private var viewModel: DetailScreenViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = DetailScreenViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
