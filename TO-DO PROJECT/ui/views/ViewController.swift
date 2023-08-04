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
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        let t1 = ToDo(to_do_id: 1, to_do_ad: "Ödev Yapılacak")
        let t2 = ToDo(to_do_id: 2, to_do_ad: "Alışveriş Yapılacak")
        let t3 = ToDo(to_do_id: 3, to_do_ad: "Cilt Bakımı Yapılacak")
        toDoListesi.append(t1)
        toDoListesi.append(t2)
        toDoListesi.append(t3)
        

    
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
        print("To-Do Ara: \(searchText) ")
        
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
                print("TO-DO Sil : \(toDo.to_do_id!)")
                
            }
            alert.addAction(evetAction)
            self.present(alert,animated: true)
            
        
    }
        return UISwipeActionsConfiguration(actions: [silAction])
}


}
