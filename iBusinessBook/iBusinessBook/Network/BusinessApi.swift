//
//  BusinessApi.swift
//  iBusinessBook
//
//  Created by Kevin Tito on 6/20/18.
//  Copyright © 2018 BUSINESSBOOK. All rights reserved.
//

import Foundation

class BusinessApi {
    static let baseUrl = "http://chemita96-001-site1.dtempurl.com/"
    
    public static var getLocalUrl:String{
        return "\(baseUrl)businessbookapi/v1/companies/1/locals"    }
    
    public static var postLoginUrl:String{
        return "\(baseUrl)businessbookapi/v1/login" }
    
    public static var postRegisterUrl:String{
        return "\(baseUrl)businessbookapi/v1/registeremployee" }
    
    public static var key: String{
        return Bundle.main.object(
            forInfoDictionaryKey: "BusinessApiKey") as! String
    }
}
