//
//  HelpViewController.swift
//  FacebookClone
//
//  Created by Jackson Cuevas on 2/8/24.
//

import UIKit
import Alamofire

// 1. Crear modelo Codable (estructura)
// 2. Utilizar JSONDecoder para serializar Data a Modelo

struct Human: Codable {
    let user: String
    let age: Int
    let isHappy: Bool
}

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
        
        AF.request(endpoint, method: .get, parameters: nil).responseData { (response: AFDataResponse<Data>) in
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            if response.error != nil {
                print("Hubo un error!")
                return
            }
            
            guard let dataFromService = response.data,
                  let model: Human = try? JSONDecoder().decode(Human.self, from: dataFromService) else {
                return
            }
            
            //Importante: TODOS los llamados a la UI, se hacen en el main thread
            DispatchQueue.main.async {
                self.nameLabel.text = model.user
                self.statusLabel.text = model.isHappy ? "Es feliz!" : "Es triste!"
            }
            
        }
    }
}
