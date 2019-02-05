//
//  PhotosCarouselCellViewModel.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit

class PhotosCarouselCellViewModel: RestaurantDetailsCellViewModel {

    lazy var photosDatas: [ImageSet] = [ImageSet]()
    
    init(photosDatas: [ImageSet]) {
        super.init()
        self.photosDatas = photosDatas
    }
}
