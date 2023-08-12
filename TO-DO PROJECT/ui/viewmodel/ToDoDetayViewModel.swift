//
//  ToDoDetayViewModel.swift
//  TO-DO PROJECT
//
//  Created by Seyma Catikkasli on 12.08.2023.
//

import Foundation

class ToDoDetayViewModel {
    var krepo = ToDoDaoRepository()
    
    
    func guncelle(to_do_id:Int, to_do_ad:String){
        krepo.guncelle(to_do_id: to_do_id, to_do_ad: to_do_ad)
    }
}
