//
//  LocalCollectionViewController.swift
//  iBusinessBook
//
//  Created by Kevin Tito on 6/21/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

private let reuseIdentifier = "Cell"

class LocalCell: UICollectionViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var direction: UILabel!
    
    func getListLocals(from local: Local){
        nameLabel.text = local.name
        direction.text = local.direction
    }
    
}

class LocalViewController: UICollectionViewController {
    var locals: [Local] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        getLocalList()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return locals.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            as! LocalCell
        // Configure the cell
        cell.getListLocals(from: locals[indexPath.row])
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    func getLocalList(){
        
        let headers: HTTPHeaders = ["Authorization": BusinessApi.key]
        Alamofire.request(BusinessApi.getLocalUrl, parameters: ["companyId" : "1" ] ,headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON(completionHandler: {response in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    //let status = json["response"]
                    if response.response?.statusCode != 200 {
                        print("Business Error: \(json["Message"].stringValue)")
                        //print("Count \(locals.count) Locals")
                        return
                    }
                    self.locals = Local.buildAll(from: json["Result"].arrayValue)
                    self.collectionView!.reloadData()
                case .failure(let error):
                    print("Networking Error: \(error.localizedDescription)")
                }
            })
    }

}
