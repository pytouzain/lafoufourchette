//
//  PhotosCarouselCell.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import iCarousel
import SnapKit
import SDWebImage

class PhotosCarouselCell: RestaurantDetailsCell {
    
    lazy var carousel: iCarousel = iCarousel()
    lazy var labelNumberOfPhotos: UILabel = UILabel()
    
    override func setUpCell() {
        setUpViews()
        carousel.reloadData()
    }
}

extension PhotosCarouselCell {
    
    func setUpViews() {
        setUpCarousel()
        setUpLabelNumberOfPhotos()
    }
    
    private func setUpCarousel() {
        addSubview(carousel)
        carousel.dataSource = self
        carousel.delegate = self
        carousel.type = .linear
        carousel.bounces = false
        carousel.isPagingEnabled = true
        carousel.backgroundColor = UIColor.lightGrayByLaFoufourchette()
        
        carousel.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.trailing.equalTo(self)
            make.leading.equalTo(self)
        }
    }
    
    private func setUpLabelNumberOfPhotos() {
        addSubview(labelNumberOfPhotos)
        labelNumberOfPhotos.textColor = UIColor.white
        labelNumberOfPhotos.text = "\((viewModel as! PhotosCarouselCellViewModel).photosDatas.count)"
        labelNumberOfPhotos.font = Constants.Fonts.kNumberOfPhotosFont
        labelNumberOfPhotos.textAlignment = .center
        
        labelNumberOfPhotos.snp.makeConstraints { [unowned self] (make) in
            make.bottom.equalTo(self).inset(Constants.Margins.kNumberOfPhotosBottomMargin)
            make.leading.equalTo(self).inset(Constants.Margins.kNumberOfPhotosLeadingMargin)
        }
    }
}

extension PhotosCarouselCell: iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return (viewModel as! PhotosCarouselCellViewModel).photosDatas.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView()
        let imageSet = (viewModel as! PhotosCarouselCellViewModel).photosDatas[index]
        
        imageView.sd_setImage(with: URL(string: imageSet.getStringUrlAccordingToCurrentDevice()))
        
        imageView.bounds = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        return imageView
    }

}

extension PhotosCarouselCell: iCarouselDelegate {
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        //Open new view controller like in LaFoufourchette Application
    }
}
