//
//  billsListViewController.swift
//  eReceipts
//
//  Created by Dama Narendra on 11/14/17.
//  Copyright © 2017 Narendra Dama. All rights reserved.
//

import UIKit

class currentBillCell: UITableViewCell {
    @IBOutlet weak var amountDataField: UILabel!
    @IBOutlet weak var dateDataField: UILabel!
    @IBOutlet weak var placeDataField: UILabel!
    @IBOutlet weak var billReceipt: UIImageView!
    
}

class billsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var billsTableView: UITableView!
    
    var data = [Bills]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "billDetailsView"{
            if let indexpath = billsTableView.indexPathForSelectedRow{
                let destVC = segue.destination as! billDetailsViewController
                destVC.amount = data[indexpath.row].amount
                destVC.savings = data[indexpath.row].savings
                destVC.date = data[indexpath.row].date!
                destVC.place = data[indexpath.row].place!
                destVC.image = data[indexpath.row].receipt! as NSData
            }
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        fetchData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell = billsTableView.dequeueReusableCell(withIdentifier: "currentBill", for: indexPath) as! currentBillCell

        mycell.amountDataField.text =   String(data[indexPath.row].amount)
        mycell.dateDataField.text   =   data[indexPath.row].date
        mycell.placeDataField.text  =   data[indexPath.row].place
        mycell.billReceipt.image    =   UIImage(data: data[indexPath.row].receipt!)
        
        return mycell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]?{
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            
            
            let alert = UIAlertController(title: "Delete Receipt", message: "Are you sure you want to delete the receipt?", preferredStyle: .alert)
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func fetchData(){
        
        do{
            data = try context.fetch(Bills.fetchRequest())
            
            billsTableView.reloadData()
        }
        catch{
            // Handler
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
