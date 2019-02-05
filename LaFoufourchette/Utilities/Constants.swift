//
//  Constants.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit

class Constants: NSObject {
    struct Urls {
        static let kBaseApiUrl = "https://api.lafoufourchette.com/api"
        static let kRestaurantDetailsMethod = "restaurant_get_info"
    }
    
    struct Numerics {
        static let kRestaurantId = 6861
        static let kMapRestaurantRegionSpan = 0.008
    }
    
    struct Fonts {
        static let kNumberOfPhotosFont = UIFont(name: "HelveticaNeue-Bold", size: 18)!
        
        static let kRestaurantNameFont = UIFont(name: "HelveticaNeue-Bold", size: 30)!
        
        static let kRestaurantAddressFont = UIFont(name: "HelveticaNeue-Light", size: 16)!
        
        static let kRestaurantRatingLeftPartFont = UIFont(name: "HelveticaNeue-Bold", size: 34)!
        
        static let kRestaurantRatingRightPartFont = UIFont(name: "HelveticaNeue-Light", size: 14)!
        
        static let kRestaurantRateCountFont = UIFont(name: "HelveticaNeue-Light", size: 14)!
        
        static let kRestaurantCardPriceBoldFont = UIFont(name: "HelveticaNeue-Bold", size: 15)!
        
        static let kRestaurantCardPriceFont = UIFont(name: "HelveticaNeue", size: 15)!
    }
    
    struct Margins {
        static let kNumberOfPhotosLeadingMargin: CGFloat = 12.0
        static let kNumberOfPhotosBottomMargin: CGFloat = 8.0
        
        static let kRestaurantNameTopMargin: CGFloat = 8.0
        static let kRestaurantNameLeadingMargin: CGFloat = 24.0
        static let kRestaurantNameTrailingMargin: CGFloat = 24.0
        static let kRestaurantNameTotalLeadingTrailingMargins = kRestaurantNameLeadingMargin + kRestaurantNameTrailingMargin
        
        static let kRestaurantAddressTopMargin: CGFloat = 4.0
        static let kRestaurantAddressLeadingMargin: CGFloat = 24.0
        static let kRestaurantAddressTrailingMargin: CGFloat = 24.0
        static let kRestaurantAddressTotalLeadingTrailingMargins = kRestaurantAddressLeadingMargin + kRestaurantAddressTrailingMargin
        
        static let kRestaurantRatingTopMargin: CGFloat = 8.0
        
        static let kRestaurantRateCountTopMargin: CGFloat = 0.0
        
        static let kBottomViewTopMargin: CGFloat = 8.0
        static let kBottomViewHeight: CGFloat = 65.0
        
        static let kRestaurantCardPriceLeadingMargin: CGFloat = 24.0
        static let kRestaurantCardPriceTrailingMargin: CGFloat = 24.0
        static let kRestaurantCardPriceTotalLeadingTrailingMargin = kRestaurantCardPriceLeadingMargin + kRestaurantCardPriceTrailingMargin
    }
    
    struct Keys {
        static let kRestaurantDetailsKey = "THEFOFORKAPIKEY"
        static let kDataKey = "data"
    }
    
    struct CellIdentifiers {
        static let kPhotosCarouselCellIdentifier = "kPhotosCarouselCellIdentifier"
        static let kInfosRestaurantCellIdentifier = "kInfosRestaurantCellIdentifier"
        static let kMapRestaurantCellIdentifier = "kMapRestaurantCellIdentifier"
    }
}
