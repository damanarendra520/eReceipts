//
//  billsViewController.swift
//  eReceipts
//
//  Created by Dama Narendra on 11/13/17.
//  Copyright © 2017 Narendra Dama. All rights reserved.
//

import UIKit

class billsViewController: UIViewController{

    enum TabIndex : Int {
        case bills  = 0
        case view   = 1
    }
    
    var data = [Bills]()
    
    @IBOutlet weak var changeView: segmentView!
    @IBOutlet weak var contentView: UIView!
    
    var currentViewController: UIViewController?
    
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "allBillsViewlist")
        return firstChildTabVC
    }()
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "chartDataView")
        
        return secondChildTabVC
    }()
    
    @IBAction func switchData(_ sender: UISegmentedControl) {
        
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        
        displayCurrentTab(sender.selectedSegmentIndex)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeView.selectedSegmentIndex = TabIndex.bills.rawValue
        displayCurrentTab(TabIndex.bills.rawValue)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        
        switch index {
        case TabIndex.bills.rawValue :
            vc = firstChildTabVC
        case TabIndex.view.rawValue :
            vc = secondChildTabVC
        default:
            return nil
        }
        
        return vc
    }
    

}
