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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let t = toDo {
            tfToDo.text = t.to_do_ad
        }

    }
        
    
    @IBAction func guncelleButton(_ sender: Any) {
        
        if let ta = tfToDo.text , let t = toDo {
            guncelle(to_do_id: t.to_do_id!, to_do_ad: ta)
        }
    }
    
    
    
    func guncelle(to_do_id:Int, to_do_ad:String){
        print("To-Do Güncelle : \(to_do_id) - \(to_do_ad)")
        
    }
    
}
