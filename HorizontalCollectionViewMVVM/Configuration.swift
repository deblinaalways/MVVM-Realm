//
//  Configuration.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation

enum Configuration: String {
    case fetchURL = "Fetch User URL"
    
    func value() -> AnyObject {
        if let value = Bundle.main.object(forInfoDictionaryKey: rawValue) {
            return value as AnyObject
        } else {
            let errorMessage = "Configuration setting not found in info.plist for key \(rawValue)."
            assertionFailure(errorMessage)
            return errorMessage as AnyObject   // This will never execute. But the code is added to silence a compiler error message.
        }
    }
}
