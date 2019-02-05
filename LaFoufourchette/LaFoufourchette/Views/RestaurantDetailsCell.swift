//
//  RestaurantDetailsCell.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit

class RestaurantDetailsCell: UICollectionViewCell {
    
    lazy var viewModel: RestaurantDetailsCellViewModel = RestaurantDetailsCellViewModel()
    
    func setUpCell() {
        backgroundColor = UIColor.black
    }
}
