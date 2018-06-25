//
//  ProfileViewController.swift
//  iBusinessBook
//
//  Created by Jacqueline Altamirano on 24/06/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var companyUITextField: UITextField!
    
    @IBOutlet weak var addressUITextField: UITextField!
    
    @IBOutlet weak var emailUITextField: UITextField!    
  
    @IBOutlet weak var phoneUITextField: UITextField!
    
    @IBOutlet weak var mobileUITextField: UITextField!
    
    
    @IBAction func saveData(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
