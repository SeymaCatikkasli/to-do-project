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
        veritabaniKopyala()
        toDoListesi = krepo.toDoListesi
    }
    func sil(to_do_id:Int){
        krepo.sil(to_do_id: to_do_id)
        toDoYukle()
    }
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func toDoYukle(){
        krepo.toDoYukle()
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDos2", ofType: ".sqlite")
        
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabaniUrl = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDos2.sqlite")
        let fm  = FileManager.default
        if fm.fileExists(atPath: veritabaniUrl.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniUrl.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
    }
    
