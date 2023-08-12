//
//  ViewController.swift
//  TO-DO PROJECT
//
//  Created by Seyma Catikkasli on 1.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
   var  toDoListesi = [ToDo]()
    var viewModel = ViewControllerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        _ = viewModel.toDoListesi.subscribe(onNext : {
            liste in
            
            self.toDoListesi = liste
            self.toDoTableView.reloadData()
        })
        

    
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.toDoYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toDetay" {
            if let toDo = sender as? ToDo {
                let gidilecekVC = segue.destination as! ToDoDetay
                gidilecekVC.toDo = toDo
            }
        }
    }
    
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
        
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDoListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "toDoHucre") as! ToDoHucre
        hucre.labelToDoAd.text = toDo.to_do_ad
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            contextulAction,view,bool in
            let toDo = self.toDoListesi[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(toDo.to_do_ad!) silinsin mi ? ", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){
                action in
                self.viewModel.sil(to_do_id: toDo.to_do_id!)
                
            }
            alert.addAction(evetAction)
            self.present(alert,animated: true)
            
        
    }
        return UISwipeActionsConfiguration(actions: [silAction])
}


}
