//
//  ToDoDaoRepository.swift
//  TO-DO PROJECT
//
//  Created by Seyma Catikkasli on 12.08.2023.
//

import Foundation
import RxSwift

class ToDoDaoRepository {
    var toDoListesi = BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    func kaydet(to_do_ad:String)  {
        print("To-Do Kaydet : \(to_do_ad)")
    }
    
    
    func guncelle(to_do_id:Int, to_do_ad:String){
        print("To-Do Güncelle : \(to_do_id) - \(to_do_ad)")
        
    }
    
    func sil(to_do_id:Int){
        print("TO-DO sil : \(to_do_id)")
    }
    func ara(aramaKelimesi:String){
        print("TO-DO ara : \(aramaKelimesi)")
    }
    func toDoYukle(){
        var liste = [ToDo]()
        let t1 = ToDo(to_do_id: 1, to_do_ad: "Ödev Yapılacak")
        let t2 = ToDo(to_do_id: 2, to_do_ad: "Alışveriş Yapılacak")
        let t3 = ToDo(to_do_id: 3, to_do_ad: "Cilt Bakımı Yapılacak")
        liste.append(t1)
        liste.append(t2)
        liste.append(t3)
        toDoListesi.onNext(liste)
    }
}
