//
//  addBillsViewController.swift
//  eReceipts
//
//  Created by Dama Narendra on 11/13/17.
//  Copyright © 2017 Narendra Dama. All rights reserved.
//

import UIKit

class addBillsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{


    @IBOutlet weak var billDateField: UITextField!
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var billPlaceField: UITextField!
    @IBOutlet weak var billSavings: UITextField!
    
    let imagePicker = UIImagePickerController()
    @IBOutlet var imagePickerView: UIImageView!
    

    @IBAction func pickImageSelected(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        
        let exportOptions: UIAlertController = UIAlertController(title: "Choose One", message: "Choose an option!", preferredStyle: .actionSheet)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        
        exportOptions.addAction(cancelAction)
        
        let photoLibrary: UIAlertAction = UIAlertAction(title: "photoLibrary", style: .default) { action -> Void in
            
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        exportOptions.addAction(photoLibrary)
        
        let camera: UIAlertAction = UIAlertAction(title: "camera", style: .default) { action -> Void in
            
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }
        exportOptions.addAction(camera)
        
        self.present(exportOptions, animated: true, completion: nil)
        
        
    }
    
    @IBAction func dismissAddBills(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBills(_ sender: UIBarButtonItem) {
        
        let billData = Bills(context: context)
        
        billData.date       =   billDateField.text!
        billData.amount     =   Int16(billAmountField.text!)!
        billData.place      =   billPlaceField.text!
        billData.savings    =   Int16(billSavings.text!)!
        
        let imageData = UIImageJPEGRepresentation(imagePickerView.image!, 1)
        
        billData.receipt = imageData
        
        appDelegate.saveContext()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.contentMode = .scaleAspectFit
            imagePickerView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
