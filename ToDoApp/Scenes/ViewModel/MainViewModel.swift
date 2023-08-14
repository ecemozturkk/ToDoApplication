//
//  MainViewModel.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 14.08.2023.
//

/// DONE
import Foundation
import RxSwift

class MainViewModel {
    var trepo = ToDosDaoRepository()
    
    var todosList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    init() {
        todosList = trepo.todosList
    }
    func deleteTodo (id : Int) {
        trepo.deleteTodo(id: id)
        reloadTodos()
    }
    func searchTodo (aramaKelimesi: String) {
        trepo.searchTodo(aramaKelimesi: aramaKelimesi)
    }
    func reloadTodos() {
        trepo.reloadTodos()
    }
}

