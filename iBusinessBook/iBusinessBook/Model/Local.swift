//
//  Local.swift
//  iBusinessBook
//
//  Created by Kevin Tito on 6/20/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import Foundation
import SwiftyJSON

class Local{
    var localId: String
    var name: String
    var direction: String
    var company: String
    var state: String
    
    init(localId: String, name: String, direction: String, company: String, state: String){
        self.localId = localId
        self.name = name
        self.direction = direction
        self.company = company
        self.state = state
    }
    convenience init(jsonLocal: JSON ){
        self.init(localId: jsonLocal["localId"].stringValue,
                  name: jsonLocal["name"].stringValue,
                  direction: jsonLocal["direction"].stringValue,
                  company: jsonLocal["company"].stringValue,
                  state: jsonLocal["state"].stringValue)
    }
    
    static func buildAll(from jsonLocals: [JSON]) -> [Local]{
        var locals: [Local] = []
        let count = jsonLocals.count
        for i in 0 ..< count{
            locals.append(Local(jsonLocal: jsonLocals[i]))
        }
        return locals
    }
}
