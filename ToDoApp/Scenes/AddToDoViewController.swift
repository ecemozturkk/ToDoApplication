//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 3.08.2023.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var viewModel = AddToDoViewModel()
    
    @IBOutlet weak var tfNewToDo: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if let newToDo = tfNewToDo.text {
            viewModel.addTodo(name: newToDo)
            
        }
    }
  
        
}
