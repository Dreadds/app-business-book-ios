//
//  HomeViewController.swift
//  iBusinessBook
//
//  Created by Kevin Tito on 6/20/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testConnectivity()
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
    
    func testConnectivity(){
        
        let headers: HTTPHeaders = ["Authorization": BusinessApi.key]
        Alamofire.request(BusinessApi.getLocalUrl, parameters: ["companyId" : "1" ] ,headers: headers)
            .validate(contentType: ["application/json"])
        .responseJSON(completionHandler: {response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                //let status = json["response"]
                if response.response?.statusCode == 200 {
                    let locals = Local.buildAll(from: json["Result"].arrayValue)
                    print("Count \(locals.count) Locals")
                }
                print("Business Error: \(json["Message"].stringValue)")
                return
            case .failure(let error):
                print("Networking Error: \(error.localizedDescription)")
            }
        })
    }

}
