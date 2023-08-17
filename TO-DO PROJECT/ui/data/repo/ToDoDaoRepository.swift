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
    
    let db:FMDatabase?
    
    init() {
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniUrl = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDos2.sqlite")
        db = FMDatabase(path: veritabaniUrl.path)
    }
    func kaydet(to_do_ad:String)  {
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO toDos (yapilacak_adi) VALUES (?)", values: [to_do_ad])
        }catch {
            print(error.localizedDescription)
        }
        
        db?.close()

    }
    
    
    func guncelle(to_do_id:Int, to_do_ad:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE toDos SET yapilacak_adi = ?  WHERE yapilacak_id = ?", values: [to_do_ad,to_do_id])
        }catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func sil(to_do_id:Int){
        
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM toDos WHERE yapilacak_id = ?", values: [to_do_id])
        }catch {
            print(error.localizedDescription)
        }
        
        db?.close()    }
    
    func ara(aramaKelimesi:String){
        
        db?.open()
        var liste = [ToDo]()

        do{
            let result = try db!.executeQuery("SELECT * FROM toDos WHERE yapilacak_adi like  '%\(aramaKelimesi)%'", values: nil)
            
            while result.next() {
                let yapilacak_id = Int(result.string(forColumn: "yapilacak_id"))!
                let yapilacak_adi = result.string(forColumn: "yapilacak_adi")!
                let toDo = ToDo(to_do_id: yapilacak_id, to_do_ad: yapilacak_adi)
                liste.append(toDo)
            }
             toDoListesi.onNext(liste)

        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func toDoYukle(){
        
        db?.open()
        var liste = [ToDo]()

        do{
            let result = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            
            while result.next() {
                let yapilacak_id = Int(result.string(forColumn: "yapilacak_id"))!
                let yapilacak_adi = result.string(forColumn: "yapilacak_adi")!
                let toDo = ToDo(to_do_id: yapilacak_id, to_do_ad: yapilacak_adi)
                liste.append(toDo)
            }
             toDoListesi.onNext(liste)

        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        
    }
}
