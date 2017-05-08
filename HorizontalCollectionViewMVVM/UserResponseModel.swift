//
//  UserResponseModel.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

struct UserDataResponse {
    
    let userDataList: [JSON]
    
    init(_ serverResponse: JSON) throws {
        print(serverResponse)
        self.userDataList = serverResponse.arrayValue
        userDataList.forEach {
            decodeUserData(data: $0)
        }
    }
    
    func decodeUserData(data: JSON) {
        let id          = data["id"].intValue
        let name        = data["name"].stringValue
        let userName    = data["username"].stringValue
        let email       = data["email"].stringValue
        let phoneString = data["phone"].stringValue
        let phone       = phoneString.components(separatedBy: " x")
        let website     = data["website"].stringValue
        
        let address     = data["address"].dictionaryValue
            let street      = address["street"]?.stringValue
            let suite       = address["suite"]?.stringValue
            let city        = address["city"]?.stringValue
            let zipcode     = address["zipcode"]?.stringValue
            let geoLocation = address["geo"]?.dictionaryValue
            let latitude    = geoLocation?["lat"]?.stringValue
            let longitude   = geoLocation?["lng"]?.stringValue
        
        let company = data["company"].dictionaryValue
            let companyName = company["name"]?.stringValue
            let catchPhrase = company["catchPhrase"]?.stringValue
            let bs          = company["bs"]?.stringValue
        
        let user = User()
        user.id        = id
        user.name      = name
        user.username  = userName
        user.email     = email
        user.phone     = phone[0]
        user.phoneExtn = phone.count > 1 ? phone[1] : ""
        user.website   = website
        
        let userAddress = Address()
            userAddress.street    = street!
            userAddress.suite     = suite!
            userAddress.city      = city!
            userAddress.zipcode   = zipcode!
            userAddress.latitude  = Double(latitude!)!
            userAddress.longitude = Double(longitude!)!
        
        let userCompany = Company()
            userCompany.name        = companyName!
            userCompany.catchPhrase = catchPhrase!
            userCompany.bs          = bs!
        
        user.address = userAddress
        user.company = userCompany

        UserViewModel(user: user).saveUserToRealm()
    }
}
