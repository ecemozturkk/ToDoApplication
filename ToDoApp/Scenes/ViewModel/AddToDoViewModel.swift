//
//  AddToDoViewModel.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 14.08.2023.
//

import Foundation
/// DONE

class AddToDoViewModel {
    var trepo = ToDosDaoRepository()
    
    func addTodo (name: String) {
        trepo.addTodo(name: name)
    }
}
