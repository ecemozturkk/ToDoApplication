//
//  ViewController.swift
//  ToDoApp
//
//  Created by Ecem Öztürk on 3.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var todoTableView: UITableView!
    
    var todosList = [ToDos]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
        
        let t1 = ToDos(id: 1, name: "Cleaning")
        let t2 = ToDos(id: 1, name: "Working")
        let t3 = ToDos(id: 1, name: "Studying")
        let t4 = ToDos(id: 1, name: "Cleaning")
        let t5 = ToDos(id: 1, name: "Cleaning")
        let t6 = ToDos(id: 1, name: "Cleaning")
        todosList.append(t1)
        todosList.append(t2)
        todosList.append(t3)
        todosList.append(t4)
        todosList.append(t5)
        todosList.append(t6)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let todo = sender as? ToDos {
                let destinationVC = segue.destination as! DetailsViewController
                destinationVC.toDo = todo
            }
        }
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search To Do: \(searchText)")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todosList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoTableViewCell
        cell.todoLbl.text = todo.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todosList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){contextualAction, view, bool in
            let todo = self.todosList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete To Do", message: "Do you want to delete \(todo.name!)?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
                print("Deleted to-do: \(todo.name!)")
            }
            alert.addAction(deleteAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
