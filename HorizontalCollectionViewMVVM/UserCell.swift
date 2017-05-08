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
    
    private(set) var userViewModel: UserViewModel!
    func configure(with userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        configureUI()
    }
    
    private func configureUI() {
        nameText.text = userViewModel.nameText
        userNameText.text = userViewModel.userNameText
        emailText.text = userViewModel.emailText
        streetText.text = userViewModel.street
        suiteText.text = userViewModel.suit
        cityText.text = userViewModel.city
        zipText.text = userViewModel.zipcode
        phoneText.text = userViewModel.phoneText
        websiteText.text = userViewModel.websiteText
        companyNameText.text = userViewModel.companyNameText
        catchPhrase.text = ""
        var index = 0
        for phrase in userViewModel.catchPhraseArray {
            if index == 0 { catchPhrase.text = phrase; index = index + 1 } else {
                catchPhrase.text = catchPhrase.text! + ", " + phrase
            }
        }
        bsText.text = userViewModel.bs
        // Coordinates show into sea as per the data :(
        let annotation = MapAnnotation(coordinate: userViewModel.userLocation)
        mapView.addAnnotation(annotation)
        let region = MapRegionHelper.mapRegionForCoordinates(coordinates: [userViewModel.userLocation])
        mapView.setRegion(region!, animated: true)
    }
    
}
