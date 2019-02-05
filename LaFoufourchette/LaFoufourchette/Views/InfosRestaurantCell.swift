//
//  InfosRestaurantCell.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit

class InfosRestaurantCell: RestaurantDetailsCell {
    
    lazy var labelName: UILabel = UILabel()
    lazy var labelAddress: UILabel = UILabel()
    lazy var labelGeneralRating: UILabel = UILabel()
    lazy var labelRateCount: UILabel = UILabel()
    
    lazy var bottomView: UIView = UIView()
    lazy var labelAveragePrice: UILabel = UILabel()
    
    override func setUpCell() {
        setUpViews()
    }
}

extension InfosRestaurantCell {
    
    func setUpViews() {
        setUpLabelName()
        setUpLabelAddress()
        setUpLabelGeneralRating()
        setUpLabelRateCount()
        setUpBottomView()
        setUpLabelAveragePrice()
    }

    private func setUpLabelName() {
        addSubview(labelName)
        labelName.text = (viewModel as! InfosRestaurantCellViewModel).restaurant.name
        labelName.font = Constants.Fonts.kRestaurantNameFont
        
        labelName.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self).inset(Constants.Margins.kRestaurantNameTopMargin)
            make.leading.equalTo(self).inset(Constants.Margins.kRestaurantNameLeadingMargin)
            make.trailing.equalTo(self).inset(Constants.Margins.kRestaurantNameTrailingMargin)
        }
    }
    
    private func setUpLabelAddress() {
        addSubview(labelAddress)
        labelAddress.text = (viewModel as! InfosRestaurantCellViewModel).restaurant.getFormattedAddressString()
        labelAddress.textColor = UIColor.lightGray
        labelAddress.font = Constants.Fonts.kRestaurantAddressFont
        
        labelAddress.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.labelName.snp.bottom).offset(Constants.Margins.kRestaurantAddressTopMargin)
            make.leading.equalTo(self).inset(Constants.Margins.kRestaurantAddressLeadingMargin)
            make.trailing.equalTo(self).inset(Constants.Margins.kRestaurantAddressTrailingMargin)
        }
    }
    
    private func setUpLabelGeneralRating() {
        addSubview(labelGeneralRating)
        labelGeneralRating.attributedText = (viewModel as! InfosRestaurantCellViewModel).restaurant.getFormattedRatingAttributedString()
        
        labelGeneralRating.snp.makeConstraints { [unowned self] (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.labelAddress.snp.bottom).offset(Constants.Margins.kRestaurantRatingTopMargin)
        }
    }
    
    private func setUpLabelRateCount() {
        addSubview(labelRateCount)
        labelRateCount.text = (viewModel as! InfosRestaurantCellViewModel).restaurant.getFormattedRateCountString()
        labelRateCount.textColor = UIColor.lightGray
        labelRateCount.font = Constants.Fonts.kRestaurantRateCountFont
        
        labelRateCount.snp.makeConstraints { [unowned self] (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.labelGeneralRating.snp.bottom).offset(Constants.Margins.kRestaurantRateCountTopMargin)
        }
    }
    
    private func setUpBottomView() {
        addSubview(bottomView)
        bottomView.backgroundColor = UIColor.lightGrayByLaFoufourchette()
        
        bottomView.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.labelRateCount.snp.bottom).offset(Constants.Margins.kBottomViewTopMargin)
            make.leading.equalTo(self)
            make.bottom.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(Constants.Margins.kBottomViewHeight)
        }
    }
    
    private func setUpLabelAveragePrice() {
        bottomView.addSubview(labelAveragePrice)
        labelAveragePrice.attributedText = (viewModel as! InfosRestaurantCellViewModel).restaurant.getFormattedCardPriceAttributedString()
        labelAveragePrice.textAlignment = .center
        labelAveragePrice.adjustsFontSizeToFitWidth = true
        
        labelAveragePrice.snp.makeConstraints { [unowned self] (make) in
            make.center.equalTo(self.bottomView)
            make.leading.equalTo(self.bottomView).inset(Constants.Margins.kRestaurantCardPriceLeadingMargin)
            make.trailing.equalTo(self.bottomView).inset(Constants.Margins.kRestaurantCardPriceTrailingMargin)
        }
    }
}
