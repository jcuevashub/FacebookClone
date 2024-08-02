//
//  HelpViewController.swift
//  FacebookClone
//
//  Created by Jackson Cuevas on 2/8/24.
//

import UIKit

class HelpViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchService()
    }
    
    //Endpoint: http//www.mocky.io
    // 1. Crear expecion de seguridad
    // 2. Crear URL con el endpoint
    // 3. Hacer request con la ayuda de URLSession
    // 4. Transformar respuesta a  diccionario
    // 5. Ejecutar Request
    
    private func fetchService() {
        let endpointString = "https://run.mocky.io/v3/b0e3397e-7cdb-41bc-8c37-79d57e472cf8"
        
        guard let endpoint = URL(string: endpointString) else {
            return
        }
        
        //Iniciamos el Loader
        activityIndicator.startAnimating()
        
        URLSession.shared.dataTask(with: endpoint) { (data: Data?, _, error: Error?) in
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            if error != nil {
                print("Hubo un error!")
                return
            }
            
            guard let dataFromService = data,
                  let dictionary = try? JSONSerialization.jsonObject(with: dataFromService, options: []) as? [String: Any] else {
                return
            }
            
            //Importante: TODOS los llamados a la UI, se hacen en el main thread
            DispatchQueue.main.async {
                let isHappy = dictionary["isHappy"] as? Bool ?? false
                
                self.nameLabel.text = dictionary["user"] as? String
                self.statusLabel.text = isHappy ? "Es feliz!" : "Es triste!"
            }
            
        }.resume()
    }
    

}
