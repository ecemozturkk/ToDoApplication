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
        copyDatabase()
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
    func copyDatabase () {
        let bundlePath = Bundle.main.path(forResource: "todosDB", ofType: ".sqlite")
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("todosDB.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: databaseURL.path()) {
            print("Database already exists.")
        } else {
            do {
                try fm.copyItem(atPath: bundlePath!, toPath: databaseURL.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

