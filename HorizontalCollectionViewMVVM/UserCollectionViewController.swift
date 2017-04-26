//
//  UserCollectionViewController.swift
//  HorizontalCollectionViewMVVM
//
//  Created by Deblina Das on 26/04/17.
//  Copyright © 2017 Deblina Das. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class UserCollectionViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var pageControl: UIPageControl!
    private(set) var users: Results<User>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    
}

extension UserCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 4 }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
        userCell.configure(with: User())
        return userCell
    }
}
