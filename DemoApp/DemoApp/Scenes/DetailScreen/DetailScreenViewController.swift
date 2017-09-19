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
    
    
    // MARK: - IBOutlet/IBAction
    
    @IBOutlet weak var personPhoto: UIImageView!
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var personId: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emailAddress: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var phoneButtonImage: UIImageView!
    
    @IBOutlet weak var emailButtonImage: UIImageView!
    
    @IBOutlet weak var addressButtonImage: UIImageView!
    
    
    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phoneTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(phoneImageTapped(tapGestureRecognizer:)))
        phoneButtonImage.addGestureRecognizer(phoneTapGestureRecognizer)
        
        let mailTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mailImageTapped(tapGestureRecognizer:)))
        emailButtonImage.addGestureRecognizer(mailTapGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Top View
        personName.text = "\(person.nameDetails.first) \(person.nameDetails.last)"
        personPhoto.af_setImage(withURL: URL(string: person.pictureUrls.medium)!)
        
        // Phone View
        phoneNumber.text = person.phone
        
        // E-mail View
        emailAddress.text = person.email
        
        // Address View
        address.text = "\(person.locationDetails.city), \(person.locationDetails.postcode) \(person.locationDetails.street)"
        
        // Botom Label Id
        personId.text = "ID: \(person.idDetails.name) \(person.idDetails.value)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Utils
    
    func phoneImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        callNumber(phoneNumber: person.phone)
    }

    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    func mailImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        sendEmail(email: person.email)
    }
    
    func sendEmail(email: String) {
        let subject = "Subject"
        let body = "Write text here..."
        let coded = "mailto:\(email)?subject=\(subject)&body=\(body)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        if let emailURL = URL(string: coded!)
        {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(emailURL)) {
                application.open(emailURL, options: [:], completionHandler: nil)
            }
        }
    }
}
