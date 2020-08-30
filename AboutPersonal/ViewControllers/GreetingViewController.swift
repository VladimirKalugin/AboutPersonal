//
//  GreetingViewController.swift
//  AboutPersonal
//
//  Created by Fuhrer_SS on 30.08.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet var greetingLable: UILabel!
    
    var greeting: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLable.text = "Welcome, \(greeting ?? "")!"
        
        
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        
    }
    
}
