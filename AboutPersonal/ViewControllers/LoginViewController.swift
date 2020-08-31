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
    
    let newUser = User(name: "User", password: "Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goGreeting" {
            let tabBarController = segue.destination as! UITabBarController
            let greetingVC = tabBarController.viewControllers?.first as? GreetingViewController
            if let text = userNameTextField.text {
                greetingVC?.greeting = text }
        }
    }
    
    // MARK: - IBAction
    
    
    @IBAction func loginButton() {
    if userNameTextField.text != newUser.name || passwordTextField.text != newUser.password {
               addAlert(title: "Your login or password isn't correct", massage: "Please, enter valid data", style: .alert)
               passwordTextField.text = ""
           } else if userNameTextField.text == newUser.name && passwordTextField.text == newUser.password {
               performSegue(withIdentifier: "goGreeting", sender: nil)
           }
    }
    
    @IBAction func forgotNameButton(_ sender: Any) {
        addAlert(title: "Oops!", massage: "Your name is \(newUser.name)", style: .alert)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        addAlert(title: "Oops!", massage: "Your password is \(newUser.password)", style: .alert)
    }
    
    @IBAction func unwindSegueToLoginSreen(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private func
    private func addAlert(title: String, massage: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: massage, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    // MARK: - TouchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - TextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            self.passwordTextField.becomeFirstResponder()
        } else {
            loginButton()
        }
        return true
    }
}
