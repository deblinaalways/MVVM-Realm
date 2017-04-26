//
//  UserCell.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class UserCell: UICollectionViewCell {

    @IBOutlet var nameText: UILabel!
    @IBOutlet var userNameText: UILabel!
    @IBOutlet var emailText: UILabel!
    @IBOutlet var streetText: UILabel!
    @IBOutlet var suiteText: UILabel!
    @IBOutlet var cityText: UILabel!
    @IBOutlet var zipText: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var phoneText: UILabel!
    @IBOutlet var websiteText: UILabel!
    @IBOutlet var companyNameText: UILabel!
    @IBOutlet var catchPhrase: UILabel!
    @IBOutlet var bsText: UILabel!
    
    private(set) var user: User!
    func configure(with user: User) {
        self.user = user
        configureUI()
    }
    
    private func configureUI() {
        
    }
    
}
