//
//  UserViewModel.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation
import RealmSwift
import CoreLocation

class UserViewModel {
    
    private var user: User
    
    var nameText: String { return user.name }
    var userNameText: String { return user.username }
    var emailText: String { return user.email }
    var phoneText: String { return "\(user.phone)" + " Ex\(user.phoneExtn)"}
    var websiteText: String { return user.website }
    
    var street: String {
        guard let address = user.address else { return "" }
        return address.street }
    var suit: String {
        guard let address = user.address else { return "" }
        return address.suite }
    
    var city: String {
        guard let address = user.address else { return "" }
        return address.city }
    
    var zipcode: String {
        guard let address = user.address else { return "" }
        return "\(address.zipcode)"}
    
    var userLocation: CLLocationCoordinate2D {
        guard let address = user.address else { return CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0) }
        return CLLocationCoordinate2D(latitude: address.latitude, longitude: address.longitude)
    }
    
    var userAddress: [String: AnyObject] {
        var address = [String: AnyObject]()
        address["street"] = street as AnyObject
        address["suit"] = suit as AnyObject
        address["city"] = city as AnyObject
        address["zipcode"] = zipcode as AnyObject
        address["userLocation"] = userLocation as AnyObject
        return address
    }
    
    var companyNameText: String {
        guard let company = user.company else { return "" }
        return company.name }
    
    var catchPhraseArray: [String] {
        guard let company = user.company else { return [String]() }
        return company.catchPhrase.components(separatedBy: .whitespaces)
        
    }
    var bs: String {
        guard let company = user.company else { return "" }
        return company.bs }
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserToRealm() {
        try! RealmManager.realm.write {
            RealmManager.realm.add(user)
        }
    }
}
