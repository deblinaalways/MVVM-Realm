//
//  UserModel.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class UserModel {
    var id:        Int
    var name:      String
    var username:  String
    var email:     String
    var address:   Address
    var phone:     Int
    var phoneExtn: Int
    var website:   String
    var company:   Company
    
    init(id: Int, name: String, username: String, email: String, address: Address, phone: Int, phoneExtn: Int, website: String, company: Company) {
        self.id        = id
        self.name      = name
        self.username  = username
        self.email     = email
        self.address   = address
        self.phone     = phone
        self.phoneExtn = phoneExtn
        self.website   = website
        self.company   = company
    }
    
}
