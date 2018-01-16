//
//  graphDataViewController.swift
//  eReceipts
//
//  Created by Dama Narendra on 11/15/17.
//  Copyright © 2017 Narendra Dama. All rights reserved.
//

import UIKit

class graphDataViewController: UIViewController {

    @IBOutlet weak var totalSpendinglabel: UILabel!
    @IBOutlet weak var totalSavingslabel: UILabel!
    
    var total_spending : Int16 = 0
    var total_savings : Int16 = 0
    
    var data = [Bills]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var total_spending : Int16 = 0
        var total_savings : Int16 = 0
        
        do{
            data = try context.fetch(Bills.fetchRequest())
            
            for each in data{
                total_spending += each.amount
                total_savings += each.savings
            }
            
            totalSpendinglabel.text = String(total_spending)
            totalSavingslabel.text  = String(total_savings)
        }
        catch{
            // Handler
        }
    }
}
