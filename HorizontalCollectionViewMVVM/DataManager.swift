//
//  DataManager.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import RealmSwift

enum DataManagerError: Error {
    case unknown
    case failedRequest
    case invalidResponse
}

typealias UserDataCompletion = (Results<User>?, DataManagerError?) -> ()

class DataManager {
    
    public func fetchUserData(completion: @escaping UserDataCompletion) {
        let url = Configuration.fetchURL.value() as! String
        Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON { (response) in
            DispatchQueue.main.async {
                if response.data != nil {
                    do {
                        let json = JSON(response.data!)
                        let _ = try UserDataResponse(json)
                        let userData = RealmManager.realm.objects(User.self)
                        completion(userData, nil)
                    }
                    catch { completion(nil, .invalidResponse) }
                } else { completion(nil, .failedRequest) }
            }
        }
    }
}
