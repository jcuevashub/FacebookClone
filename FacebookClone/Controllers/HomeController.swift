//
//  HomeController.swift
//  FacebookClone
//
//  Created by Jackson Cuevas on 1/8/24.
//

import UIKit

class HomeController: UIViewController {
    
    //MARK: - Referencia de la tabla
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [
        "@carlosmejia083",
        "@cvander",
        "@freddier",
        "@platzi"
    ]
    
    /*
     1. Implementar DataSource <- Interfaz
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        //Para interactuar, implementar el delegate
        tableView.delegate = self
    }
}

//MARK: - UITableViewDelegate
extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda #\(indexPath.row) fué seleccionada ")
    }
}

//MARK: - UITableViewDataSource
extension HomeController: UITableViewDataSource {
    
    //1. Número de filas que tendrá nuestra tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //2. Método para saber que celdas deben mostrarse.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath)
        
        (cell as? TweetTableViewCell)?.setupCell(username:dataSource[indexPath.row], message: "Soy un tweet")
                
        return cell
    }
    
    
}
