//
//  InfosRestaurantCellViewModel.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit

class InfosRestaurantCellViewModel: RestaurantDetailsCellViewModel {
    
    lazy var restaurant: Restaurant = Restaurant()
    
    init(restaurant: Restaurant) {
        super.init()
        self.restaurant = restaurant
    }
}
