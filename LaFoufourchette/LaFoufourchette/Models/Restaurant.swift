//
//  Restaurant.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import SwiftyJSON

class Restaurant: NSObject {

    var id: Int = 0
    var name: String = ""
    var location: Location = Location()
    var address: String = ""
    var city: String = ""
    var zipcode: String = ""
    var rateCount: Int = 0
    var currencyCode: String = ""
    var cardPrice: Int = 0
    var picsDiaporama: [ImageSet] = [ImageSet]()
    var ratings: Ratings = Ratings()
    
    override init() {
        super.init()
    }
    
    init(json: JSON) {
        id = json["id_restaurant"].int ?? 0
        name = json["name"].string ?? ""
        location.longitude = json["gps_long"].float ?? 0.0
        location.lattitude = json["gps_lat"].float ?? 0.0
        address = json["address"].string ?? ""
        city = json["city"].string ?? ""
        zipcode = json["zipcode"].string ?? ""
        rateCount = json["rate_count"].int ?? 0
        currencyCode = json["currency_code"].string ?? ""
        cardPrice = json["card_price"].int ?? 0
        
        if let picsDiaporamaJSON = json["pics_diaporama"].array {
            for picJSON in picsDiaporamaJSON {
                picsDiaporama.append(ImageSet(json: picJSON))
            }
        }
        
        ratings = Ratings(json: json["ratings"])
    }
    
    func getRealPicsDiaporamaHeightAccordingToCurrentDevice() -> CGFloat {
        if DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPHONE_5 {
            return 172.0
        } else if DeviceType.IS_IPHONE_6 || DeviceType.IS_IPHONE_7 {
            return 187.0
        } else if DeviceType.IS_IPHONE_6P || DeviceType.IS_IPHONE_7P {
            return 243.0
        } else if DeviceType.IS_IPAD || DeviceType.IS_IPAD_PRO {
            return 365.0
        }
        return 0.0
    }
}

extension Restaurant {
    
    func getFormattedAddressString() -> String {
        return "\(address) \(zipcode) \(city)"
    }
    
    func getFormattedRatingAttributedString() -> NSAttributedString {
        let mutableString = NSMutableAttributedString(string: "\(ratings.globalRate / 10)/10", attributes: [NSFontAttributeName:Constants.Fonts.kRestaurantRatingRightPartFont])
        
        mutableString.addAttributes([NSFontAttributeName:Constants.Fonts.kRestaurantRatingLeftPartFont], range: NSRange(location: 0, length: 3))
        return mutableString
    }
    
    func getFormattedRateCountString() -> String {
        return "\(rateCount) avis LaFoufourchette"
    }
    
    func getFormattedCardPriceAttributedString() -> NSAttributedString {
        let baseString = "Prix moyen à la carte de ce restaurant: \(cardPrice)\(getSymbolForCurrencyCode(code: currencyCode))"
        
        let mutableString = NSMutableAttributedString(string: baseString, attributes: [NSFontAttributeName:Constants.Fonts.kRestaurantCardPriceFont])
        
        mutableString.addAttributes([NSFontAttributeName:Constants.Fonts.kRestaurantCardPriceBoldFont], range: NSString(string: baseString).range(of: "Prix moyen"))
        
        mutableString.addAttributes([NSFontAttributeName:Constants.Fonts.kRestaurantCardPriceBoldFont], range: NSString(string: baseString).range(of: "\(cardPrice)\(getSymbolForCurrencyCode(code: currencyCode))"))
        
        return mutableString
    }
    
    private func getSymbolForCurrencyCode(code: String) -> String {
        let locale = NSLocale(localeIdentifier: code)
        return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code) ?? ""
    }
}
