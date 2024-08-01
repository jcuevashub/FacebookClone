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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonAction() {
        //1. Obterner los valores de los textfield.
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "jackson@cuevas.com", password == "123" {
            print("Bienvenido!")
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            print("Credenciales Inválidas.")
        }
    }
    
}

