//
//  ToDosDaoRepository.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 14.08.2023.
//

import Foundation
import RxSwift

class ToDosDaoRepository {
    var todosList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    func addTodo (name: String) {
        print("To do added: \(name)")
    }
    func guncelle(id: Int, name:String){
        print("To do updated: \(name)")
    }
    
    func deleteTodo(id: Int) {
        print("To do deleted: \(id)")
    }
    func searchTodo(aramaKelimesi: String) {
        print("To do searching: \(aramaKelimesi)")
    }
    func reloadTodos () {
        
        var liste = [ToDos]()
        
        let t1 = ToDos(id: 1, name: "Cleaning")
        let t2 = ToDos(id: 1, name: "Working")
        let t3 = ToDos(id: 1, name: "Studying")
        let t4 = ToDos(id: 1, name: "Cleaning")
        let t5 = ToDos(id: 1, name: "Cleaning")
        let t6 = ToDos(id: 1, name: "Cleaning")
        liste.append(t1)
        liste.append(t2)
        liste.append(t3)
        liste.append(t4)
        liste.append(t5)
        liste.append(t6)
        
        todosList.onNext(liste)
    }
    
    
}
