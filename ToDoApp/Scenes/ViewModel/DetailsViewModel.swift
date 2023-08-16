//
//  DetailsViewModel.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 14.08.2023.
//

import Foundation
/// DONE
class DetailsViewModel {
    var trepo = ToDosDaoRepository()
    
    func guncelle(id: Int, name:String){
        trepo.update(id: id, name: name)
    }

}
