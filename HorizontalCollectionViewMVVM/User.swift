//
//  User.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    dynamic var id        = 0
    dynamic var name      = ""
    dynamic var username  = ""
    dynamic var email     = ""
    dynamic var address:  Address?
    dynamic var phone     = ""
    dynamic var phoneExtn = ""
    dynamic var website   = ""
    dynamic var company:  Company?
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
