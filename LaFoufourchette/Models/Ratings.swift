//
//  Ratings.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import SwiftyJSON

class Ratings: NSObject {

    var globalRate: Float = 0.0
    
    override init() {
        super.init()
    }
    
    init(json: JSON) {
        globalRate = json["global_rate"].float ?? 0.0
    }
    
}
