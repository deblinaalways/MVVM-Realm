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
    var users: Results<User>!
    fileprivate lazy var activityIndicator: ActivityIndicator = ActivityIndicator(viewController: self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        users = RealmManager.realm.objects(User.self)
        pageControl.numberOfPages = users.count
        pageControl.currentPage = 0
        if users.count == 0 || users == nil { //Data is fetched from server only once
            fetchUserDataAndReload()
        }
    }
    
    private func fetchUserDataAndReload() {
        activityIndicator.start()
        DataManager().fetchUserData { (userDataResponse, error) in
            guard error != nil else {
                DispatchQueue.main.async {
                    self.activityIndicator.stop()
                    print("Success")
                    print(userDataResponse!)
                    self.users = RealmManager.realm.objects(User.self)
                    self.collectionView.reloadData()
                }
                return
            }
        }
    }
}

extension UserCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = users.count
        return users.count }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        pageControl.currentPage = indexPath.row - 1
        let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
        let userViewModel = UserViewModel(user: users[indexPath.row])
        userCell.configure(with: userViewModel)
        return userCell
    }
}
