//
//  RestaurantDetailsViewController.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import SnapKit

class RestaurantDetailsViewController: UIViewController {

    let viewModel: RestaurantDetailsViewModel = RestaurantDetailsViewModel()
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero,
                                                                 collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        viewModel.requestRestaurantDetails(success: { [weak self] in
            print("SUCCESS")
            self?.collectionView.reloadData()
        }) { 
            print("FAILURE")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension RestaurantDetailsViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RestaurantDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let detailsCase = RestaurantDetails(rawValue: indexPath.row) ?? .none
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailsCase.cellIdentifier(), for: indexPath) as! RestaurantDetailsCell
        
        cell.viewModel = viewModel.viewModelForIndexPath(indexPath: indexPath)
        cell.setUpCell()
        
        return cell
    }
    
}

extension RestaurantDetailsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: viewModel.getHeightForIndexPath(indexPath: indexPath))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

extension RestaurantDetailsViewController {
    
    func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        for index in 0...RestaurantDetails.count {
            let detailsCase = RestaurantDetails(rawValue: index) ?? .none
            collectionView.register(detailsCase.cellClass(), forCellWithReuseIdentifier: detailsCase.cellIdentifier())
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        collectionView.backgroundColor = UIColor.white
    }
}

