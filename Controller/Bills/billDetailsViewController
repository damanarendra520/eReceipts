//
//  billDetailsViewController.swift
//  eReceipts
//
//  Created by Dama Narendra on 11/18/17.
//  Copyright © 2017 Narendra Dama. All rights reserved.
//

import UIKit
import MessageUI

class billDetailsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel:  UILabel!
    @IBOutlet weak var receiptImageData: UIImageView!
    
    @IBAction func exportButtonTapped(_ sender: Any) {
        let exportOptions: UIAlertController = UIAlertController(title: "export", message: "Choose an option!", preferredStyle: .actionSheet)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        exportOptions.addAction(cancelAction)
        
        //Create and add first option action
        let eMail: UIAlertAction = UIAlertAction(title: "eMail", style: .default) { action -> Void in
            let mailComposeViewController = self.configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        }
        exportOptions.addAction(eMail)
        
        self.present(exportOptions, animated: true, completion: nil)

    }
    
    var amount : Int16?
    var date : String?
    var place : String?
    var savings : Int16?
    var image : NSData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        placeLabel.text = place
        dateLabel.text = date
        amountLabel.text = String(describing: amount!)
        receiptImageData.image = UIImage(data: image! as Data)
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property

        mailComposerVC.setToRecipients([""])
        mailComposerVC.setSubject("Bill From eReceipts")
        mailComposerVC.setMessageBody("Hi \n\n Please find the attached bill eReceipt \n \n From eReceipt", isHTML: false)
        
        let attachmentBody = "Amount: \(amount!)\n Date: \(String(describing: date!)) \n Place: \(String(describing: place!)) \n savings: \(String(describing: savings!)) \n Image: \(UIImage(data: image! as Data)!) "
        if let data = (attachmentBody as NSString).data(using: String.Encoding.utf8.rawValue){
            mailComposerVC.addAttachmentData(data, mimeType: "text/plain", fileName: "eReceipts")
            self.present(mailComposerVC, animated: true, completion: nil)
        }
        return mailComposerVC
    }

    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }

    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }
    
}
