//
//  ViewControllerViewModel.swift
//  TO-DO PROJECT
//
//  Created by Seyma Catikkasli on 12.08.2023.
//

import Foundation
import RxSwift

class ViewControllerViewModel{
    var krepo = ToDoDaoRepository()
    var toDoListesi = BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    init(){
        toDoListesi = krepo.toDoListesi
    }
    func sil(to_do_id:Int){
        krepo.sil(to_do_id: to_do_id)
    }
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func toDoYukle(){
        krepo.toDoYukle()
    }
    }
    
