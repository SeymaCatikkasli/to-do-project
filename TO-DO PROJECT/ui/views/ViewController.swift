//
//  ViewController.swift
//  TO-DO PROJECT
//
//  Created by Seyma Catikkasli on 1.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func detayButton(_ sender: Any) {
        let toDo = ToDo(to_do_id: 1, to_do_ad: "Ödev yapılacak")
        performSegue(withIdentifier: "toDetay", sender: toDo)
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

