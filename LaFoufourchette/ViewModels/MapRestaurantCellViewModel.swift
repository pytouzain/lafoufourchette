//
//  MapRestaurantCellViewModel.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import MapKit

class MapRestaurantCellViewModel: RestaurantDetailsCellViewModel {

    lazy var location: Location = Location()
    
    init(location: Location) {
        super.init()
        self.location = location
    }
    
    func transformLocationInCLLocationCoordinate2D() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(location.lattitude), longitude: CLLocationDegrees(location.longitude))
    }
}
