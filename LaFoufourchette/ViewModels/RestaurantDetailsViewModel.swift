//
//  RestaurantDetailsViewModel.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import SwiftyJSON

enum RestaurantDetails: Int {
    case photos = 0
    case infos
    case map
    case none
    
    /* none case must always be in last position. none case is not included in count */
    static var count: Int {return RestaurantDetails.none.hashValue}
    
    func cellClass() -> UICollectionViewCell.Type {
        switch self {
        case .photos:
            return PhotosCarouselCell.self
        case .infos:
            return InfosRestaurantCell.self
        case .map:
            return MapRestaurantCell.self
        default:
            return UICollectionViewCell.self
        }
    }
    
    func cellIdentifier() -> String {
        switch self {
        case .photos:
            return Constants.CellIdentifiers.kPhotosCarouselCellIdentifier
        case .infos:
            return Constants.CellIdentifiers.kInfosRestaurantCellIdentifier
        case .map:
            return Constants.CellIdentifiers.kMapRestaurantCellIdentifier
        default:
            return "Default"
        }
    }
}

class RestaurantDetailsViewModel: NSObject {

    lazy var restaurant: Restaurant = Restaurant()
    
    func requestRestaurantDetails(success: @escaping ()->(), failure: @escaping ()->()) {
        ApiHandler.instance.getRestaurantDetails(url: generateUrl(), success: { [weak self] (json) in
            self?.restaurant = Restaurant(json: json[Constants.Keys.kDataKey])
            success()
        }) { (error) in
            failure()
        }
    }
    
    func viewModelForIndexPath(indexPath: IndexPath) -> RestaurantDetailsCellViewModel {
        let detailsCase = RestaurantDetails(rawValue: indexPath.row) ?? .none
        switch detailsCase {
        case .photos:
            return PhotosCarouselCellViewModel(photosDatas: restaurant.picsDiaporama)
        case .infos:
            return InfosRestaurantCellViewModel(restaurant: restaurant)
        case .map:
            return MapRestaurantCellViewModel(location: restaurant.location)
        default:
            return RestaurantDetailsCellViewModel()
        }
    }
    
    private func generateUrl() -> String {
        return "\(Constants.Urls.kBaseApiUrl)?key=\(Constants.Keys.kRestaurantDetailsKey)&method=\(Constants.Urls.kRestaurantDetailsMethod)&id_restaurant=\(Constants.Numerics.kRestaurantId)"
    }
    
    func getHeightForIndexPath(indexPath: IndexPath) -> CGFloat {
        let detailsCase = RestaurantDetails(rawValue: indexPath.row) ?? .none
        switch detailsCase {
        case .photos:
            return restaurant.getRealPicsDiaporamaHeightAccordingToCurrentDevice()
        case .infos:
            return calculateInfosRestaurantCellHeight()
        case .map:
            return ScreenSize.height - calculateInfosRestaurantCellHeight() - restaurant.getRealPicsDiaporamaHeightAccordingToCurrentDevice()
        default:
            return 0.0
        }
    }
    
    private func calculateInfosRestaurantCellHeight() -> CGFloat {
        let labelNameHeight = round(restaurant.name.heightWithConstrainedWidth(width: ScreenSize.width - Constants.Margins.kRestaurantNameTotalLeadingTrailingMargins, font: Constants.Fonts.kRestaurantNameFont))
        
        let labelAddressHeight = round(restaurant.getFormattedAddressString().heightWithConstrainedWidth(width: ScreenSize.width - Constants.Margins.kRestaurantAddressTotalLeadingTrailingMargins, font: Constants.Fonts.kRestaurantAddressFont))
        
        let labelRatingHeight = round(restaurant.getFormattedRatingAttributedString().heightWithConstrainedWidth(width: ScreenSize.width))
        
        let labelRateCountHeight = round(restaurant.getFormattedRateCountString().heightWithConstrainedWidth(width: ScreenSize.width, font: Constants.Fonts.kRestaurantRateCountFont))
        
        let totalTopMargins = Constants.Margins.kRestaurantNameTopMargin +
                            Constants.Margins.kRestaurantAddressTopMargin +
                            Constants.Margins.kRestaurantRatingTopMargin +
                            Constants.Margins.kRestaurantRateCountTopMargin +
                            Constants.Margins.kBottomViewTopMargin
        
        let totalHeight = labelNameHeight +
                        labelAddressHeight +
                        labelRatingHeight +
                        labelRateCountHeight +
                        Constants.Margins.kBottomViewHeight +
                        totalTopMargins
        
        return totalHeight
    }
}
