//
//  CompanyStore.swift
//  iBusinessBook
//
//  Created by Jacqueline Altamirano on 24/06/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CompanyStore{
    
    func addCompany(name:String,address:String,email:String,phone:String,mobile:String){
        let company = createObject(forEntityName:"Company")!
        company.setValue(name, forKey: "name")
        company.setValue(address, forKey: "address")
        company.setValue(email, forKey: "email")
        company.setValue(phone, forKey: "phone")
        company.setValue(mobile, forKey: "name")
        
        
    }
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    private func createObject(forEntityName name: String) -> NSManagedObject? {
        let entity = NSEntityDescription.entity(forEntityName: name, in: getContext())
        return NSManagedObject(entity: entity!, insertInto: getContext())
    }
    
}
