//
//  ProfileViewController.swift
//  iBusinessBook
//
//  Created by Jacqueline Altamirano on 24/06/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    @IBOutlet weak var companyUITextField: UITextField!
    @IBOutlet weak var addressUITextField: UITextField!    
    @IBOutlet weak var emailUITextField: UITextField!
    @IBOutlet weak var phoneUITextField: UITextField!
    @IBOutlet weak var mobileUITextField: UITextField!
    @IBOutlet weak var saveButtonItem: UIBarButtonItem!
    @IBOutlet weak var cancelButtonItem: UIBarButtonItem!
    var isAdding = false
    var store = CompanyStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        isAdding = false
        store.addCompany(name:companyUITextField.text!,address:addressUITextField.text!,
                         email:emailUITextField.text!,phone:phoneUITextField.text!,mobile:mobileUITextField.text!)
        
        updateItemsState()    }
    
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        isAdding = false
        updateItemsState()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func clearFields() {
        companyUITextField.text = ""
        addressUITextField.text = ""
        emailUITextField.text = ""
        phoneUITextField.text = ""
        mobileUITextField.text = ""
        
    }
    private func updateItemsState() {
        cancelButtonItem.isEnabled = isAdding
        saveButtonItem.isEnabled = isAdding
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
