//
//  DetailsViewController.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 3.08.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var tfNewToDo: UITextField!
    
    var viewModel = DetailsViewModel()
    
    var toDo: ToDos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = toDo {
            tfNewToDo.text = t.name
        }
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        if let td = tfNewToDo.text, let t = toDo {
            viewModel.guncelle(id: t.id!, name: td)
            //update(todo_id: t.id!, todo_name: td)
        }
        
    }
    
    func update(todo_id: Int, todo_name: String) {
        print("updated: \(todo_id) \(todo_name)")
    }
    

}
