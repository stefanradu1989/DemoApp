//
//  ListScreenTableViewCell.swift
//  DemoApp
//
//  Created by Radu Stefan on 17/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit


class ListScreenTableViewCell: UITableViewCell {

    
    // MARK: IBOutlet/IBAction
    
    @IBOutlet weak var personPhoto: UIImageView!
    
    @IBOutlet weak var personName: UILabel!

    @IBOutlet weak var personDetail: UILabel!
    
    
    // MARK: Cell Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
