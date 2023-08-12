//
//  ToDoKayit.swift
//  TO-DO PROJECT
//
//  Created by Seyma Catikkasli on 1.08.2023.
//

import UIKit

class ToDoKayit: UIViewController {

    @IBOutlet weak var tfToDo: UITextField!
    
    
    var viewModel = TodoKayitViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func kaydetButton(_ sender: Any) {
        
        if let ta = tfToDo.text {
            viewModel.kaydet(to_do_ad: ta)
        }
    }
    
   
    
}
