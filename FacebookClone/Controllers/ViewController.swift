//
//  ViewController.swift
//  FacebookClone
//
//  Created by Jackson Cuevas on 31/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailSwitch: UISwitch!
    
    private let emailKey = "email-key"
    private let storage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //De esta manera buscamos un string en los UserDefaults y lo asignamos.
        if let storedEmail = storage.string(forKey: emailKey) {
            emailTextField.text = storedEmail
            emailSwitch.isOn = true
        } else {
            emailSwitch.isOn = false
        }
    }

    @IBAction func loginButtonAction() {
        //1. Obterner los valores de los textfield.
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "jackson@cuevas.com", password == "123" {
            if emailSwitch.isOn {
                //De esta menera guardamos valores con llave y valor en los UserDefaults.
                
                storage.set(email, forKey: emailKey)
            } else {
                storage.removeObject(forKey: emailKey)
            }
            
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            print("Credenciales Inválidas.")
        }
    }
    
    
}

