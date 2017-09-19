//
//  ViewController.swift
//  DemoApp
//
//  Created by Radu Stefan on 17/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit


class ListScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var detailPerson: Person!

    private var viewModel: ListScreenViewModel!
    
    private var listScreenRouter: ListScreenRouter!
    
    
    //MARK: - IBAction/IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listScreenRouter = ListScreenRouter()
        
        viewModel = ListScreenViewModel()
        
        viewModel.onFinishedDownloadingData = {
            self.tableView.reloadData()
        }
        
        viewModel.getDataForPage(page: viewModel.lastPageLoaded)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listScreenTableViewCell", for: indexPath) as! ListScreenTableViewCell
        
        // Check if the user is at last cell
        if indexPath.row == viewModel.resultList.count - 1 {
            
            // Check if the last page has been loaded
            if viewModel.lastPageLoaded < Constants.LastPage.value {
            
                viewModel.lastPageLoaded += 1
                viewModel.getDataForPage(page: viewModel.lastPageLoaded)
            }
        }
        
        // Get person details
        let person = viewModel.resultList[indexPath.row]
        let personNameDetails = person.nameDetails
        let personPhotoUrls = person.pictureUrls
        
        // Configure the cell
        cell.selectionStyle = .none
        cell.personName.text = "\(person.nameDetails.first) \(personNameDetails.last)"
        cell.personDetail.text = "\(DateFormatter.getAgeFromDob(dob: person.dob)) years from \(viewModel.resultList[indexPath.row].nationality)"
        
        cell.personPhoto.af_setImage(withURL: URL(string: personPhotoUrls.thumbnail)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.resultList.count
    }
    
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueId.listToDetail.rawValue {
            if let destVC = segue.destination as? DetailScreenViewController {
                if let cell = sender as? ListScreenTableViewCell {
                    let cellIndexPath = tableView.indexPath(for: cell)
                    destVC.person = viewModel.resultList[cellIndexPath!.row]
                }
            }
        }
    }
}
