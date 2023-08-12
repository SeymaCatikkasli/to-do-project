//
//  TodoKayitViewModel.swift
//  TO-DO PROJECT
//
//  Created by Seyma Catikkasli on 12.08.2023.
//

import Foundation

class TodoKayitViewModel{
    var krepo = ToDoDaoRepository()
    func kaydet(to_do_ad:String)  {
        krepo.kaydet(to_do_ad: to_do_ad)
    }
}
