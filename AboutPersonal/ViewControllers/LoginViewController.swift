//
//  LoginViewController.swift
//  AboutPersonal
//
//  Created by Fuhrer_SS on 30.08.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goGreeting" {
            let tabBarController = segue.destination as! UITabBarController
            let greetingVC = tabBarController.viewControllers?[0] as! GreetingViewController
            if let text = userNameTextField.text {
                greetingVC.greeting = text }
        }
    }
    
    // MARK: - IBAction
    @IBAction func loginAction(_ sender: Any) {
        if userNameTextField.text != newUser.userName || passwordTextField.text != newUser.userPassword
        {
            addAlert(title: "Your login or password isn't correct", massage: "Please, enter valid data", style: .alert)
            passwordTextField.text = ""
        }
        else if userNameTextField.text == newUser.userName && passwordTextField.text == newUser.userPassword
        {
            performSegue(withIdentifier: "goGreeting", sender: nil)
        }
    }
    
    @IBAction func forgotNameButton(_ sender: Any) {
        addAlert(title: "Oops!", massage: "Your name is \(newUser.userName)", style: .alert)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        addAlert(title: "Oops!", massage: "Your password is \(newUser.userPassword)", style: .alert)
    }
    
    @IBAction func unwindSegueToLoginSreen(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func addAlert(title: String, massage: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: massage, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
