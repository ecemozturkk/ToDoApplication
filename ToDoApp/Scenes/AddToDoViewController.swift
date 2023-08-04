//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 3.08.2023.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    
    @IBOutlet weak var tfNewToDo: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if let newToDo = tfNewToDo.text {
            addToDo(toDo: newToDo)
        }
    }
    func addToDo(toDo: String) {
        print("deneme \(toDo)")
    }
        
}
