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
    let db: FMDatabase?
    
    init() {
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("todosDB.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func addTodo (name: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO todosDB (name) VALUES (?)", values: [name])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    func update(id: Int, name:String){
        db?.open()
        do {
            try db!.executeUpdate("UPDATE todosDB SET name = ? WHERE id = ?", values: [name, id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func deleteTodo(id: Int) {
        
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM todosDB WHERE id = ?", values: [id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func searchTodo(aramaKelimesi: String) {
        db?.open()
        var liste = [ToDos]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM todosDB WHERE name like '%\(aramaKelimesi)%'", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                
                let todo = ToDos(id: id, name: name)
                liste.append(todo)
            }
            todosList.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func reloadTodos () {
        db?.open()
        var liste = [ToDos]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM todosDB", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                
                let todo = ToDos(id: id, name: name)
                liste.append(todo)
            }
            todosList.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
