//
//  ToDoClass.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 3.08.2023.
//

import Foundation

class ToDos {

    
    var id: Int?
    var name: String?
    
    init() {
        
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
