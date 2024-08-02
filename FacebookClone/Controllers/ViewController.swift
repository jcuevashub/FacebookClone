//
//  ViewController.swift
//  FacebookClone
//
//  Created by Jackson Cuevas on 31/7/24.
//

import UIKit
import PopupDialog

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
            showErrorDialog()
        }
    }
    
    
    private func showErrorDialog() {
        // Prepare the popup assets
        let title = "Error"
        let message = "Credenciales Inválidas."
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "ADMIRE CAR", dismissOnTap: false) {
            print("What a beauty!")
        }

        let buttonThree = DefaultButton(title: "BUY CAR", height: 60) {
            print("Ah, maybe next time :)")
        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo, buttonThree])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
}

