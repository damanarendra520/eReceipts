//
//  toDoListDetailsViewController.swift
//  eReceipts
//
//  Created by Dama Narendra on 11/25/17.
//  Copyright © 2017 Narendra Dama. All rights reserved.
//

import UIKit

class toDoListDetailsCell: UITableViewCell {
    @IBOutlet weak var toDoListDetailsLabel: UILabel!
}

class toDoListDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var toDoListDetailsTable: UITableView!
    
    var data = [Details]()
    
    var segueData: String = ""
    var details : NSSet = []
    
    @IBAction func addToDoListDetails(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "To Do Details", message: "Create A List Details", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields![0].text{
                // store your data
                
                let taskData = Details(context: context)
                taskData.taskDetails = field
                
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
        self.title = segueData
        // Do any additional setup after loading the view.
        self.fetchData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let mycell = toDoListDetailsTable.dequeueReusableCell(withIdentifier: "toDoListIdentifier", for: indexPath) as! toDoListDetailsCell

        mycell.toDoListDetailsLabel.text = data[indexPath.row].taskDetails!

        return mycell
    }
    func fetchData(){
        
        do{
            data = try context.fetch(Details.fetchRequest())
            
            toDoListDetailsTable.reloadData()
        }
        catch{
            // Handler
        }
    }
}
