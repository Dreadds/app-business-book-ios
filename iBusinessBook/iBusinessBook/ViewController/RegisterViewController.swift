//
//  RegisterViewController.swift
//  iBusinessBook
//
//  Created by Katherin on 24/06/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func register() {
        let parameters = ["users" : emailTextField.text!, "password" : passwordTextField.text! ]
        Alamofire.request(BusinessApi.postRegisterUrl, method: .post, parameters: parameters)
            .validate()
            .responseJSON(completionHandler: {response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let status = json["status"].stringValue
                    if status == "error" {
                        print("BusinessApi Error: \(json["message"].stringValue)")
                        return
                    }
                    Alamofire.request(BusinessApi.postLoginUrl, method: .post, parameters: parameters)
                        .validate()
                        .responseJSON(completionHandler: {response in
                            switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                let status = json["status"].stringValue
                                if status == "error" {
                                    print("BusinessApi Error: \(json["message"].stringValue)")
                                    return
                                }
                            case .failure(let error):
                                print("Response Error: \(error.localizedDescription)")
                                
                            }
                        })
                case .failure(let error):
                    print("Response Error: \(error.localizedDescription)")
                    
                }
            })
        
    }

    @IBAction func createAcoountAction(_ sender: UIButton) {
        register()
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
