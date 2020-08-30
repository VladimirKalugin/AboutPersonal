//
//  LoginViewController.swift
//  AboutPersonal
//
//  Created by Fuhrer_SS on 30.08.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    @IBAction func loginAction(_ sender: Any) {
    }
    
    @IBAction func forgotNameButton(_ sender: Any) {
        addAlert(title: "Oops!", massage: "Your name is \(newUser.userName)", style: .alert)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        addAlert(title: "Oops!", massage: "Your password is \(newUser.userPassword)", style: .alert)
    }
 
    
    private func addAlert(title: String, massage: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: massage, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
}
