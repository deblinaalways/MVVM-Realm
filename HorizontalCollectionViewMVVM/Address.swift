//
//  Address.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation
import RealmSwift

class Address: Object {
    
    dynamic var street    = ""
    dynamic var suite     = ""
    dynamic var city      = ""
    dynamic var zipcode   = ""
    dynamic var latitude  = 0.0
    dynamic var longitude = 0.0
}
