//
//  searchDataViewController.swift
//  eReceipts
//
//  Created by Dama Narendra on 11/18/17.
//  Copyright © 2017 Narendra Dama. All rights reserved.
//

import UIKit
import CoreData

class toDoListCell: UITableViewCell {
    @IBOutlet weak var listLabel: UILabel!
}

class searchDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var ToDoList: UITableView!
    
    var data = [Task]()
    
    @IBAction func addToDoList(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "To Do List", message: "Create A List", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields![0].text {
                let taskData = Task(context: context)
                taskData.name = field
                appDelegate.saveContext()
                self.fetchData()
            } else {
                // user did not fill field
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "ToDoList"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        fetchData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell = ToDoList.dequeueReusableCell(withIdentifier: "toDoListIdentifier", for: indexPath) as! toDoListCell

        mycell.listLabel.text   = data[indexPath.row].name!
        
        return mycell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]?{
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            
            
            let alert = UIAlertController(title: "Delete Task", message: "Are you sure you want to delete the Task?", preferredStyle: .alert)
            let clearAction = UIAlertAction(title: "Yes", style: .destructive) { (alert: UIAlertAction!) -> Void in
                
                context.delete(self.data[editActionsForRowAt.row])
                self.data.remove(at: editActionsForRowAt.row)
                do {
                    try context.save()
                } catch _ {
                }
                
                // remove the deleted item from the `UITableView`
                tableView.deleteRows(at: [editActionsForRowAt], with: .fade)
                
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alert: UIAlertAction!) -> Void in
                
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(clearAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true, completion:nil)
            
        }
        delete.backgroundColor = .red
        
        return [delete]
    }
    
    func fetchData(){
        
        do{
            data = try context.fetch(Task.fetchRequest())
            
            ToDoList.reloadData()
        }
        catch{
            // Handler
        }
    }

//segue for master details
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toDoListDetailsSegueIdentify"{
//            if let indexpath = ToDoList.indexPathForSelectedRow{
//                let destVC = segue.destination as! toDoListDetailsViewController
//                destVC.segueData = data[indexpath.row].name!
//                destVC.details = (data[indexpath.row].details)!
//            }
//        }
//    }
    
}
