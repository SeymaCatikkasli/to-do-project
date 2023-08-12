//
//  ToDoDetay.swift
//  TO-DO PROJECT
//
//  Created by Seyma Catikkasli on 1.08.2023.
//

import UIKit

class ToDoDetay: UIViewController {

    @IBOutlet weak var tfToDo: UITextField!
    
    var toDo:ToDo?
    var viewModel = ToDoDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let t = toDo {
            tfToDo.text = t.to_do_ad
        }

    }
        
    
    @IBAction func guncelleButton(_ sender: Any) {
        
        if let ta = tfToDo.text , let t = toDo {
            viewModel.guncelle(to_do_id: t.to_do_id!, to_do_ad: ta)
        }
    }
    
    
    
    
}
