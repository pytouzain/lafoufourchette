//
//  MapRestaurantCell.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import MapKit

class MapRestaurantCell: RestaurantDetailsCell {
    
    lazy var mapView: MKMapView = MKMapView()
    
    override func setUpCell() {
        setUpViews()
        placeRestaurantPin()
        createRestaurantRegion()
    }
    
    func placeRestaurantPin() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = (viewModel as! MapRestaurantCellViewModel).transformLocationInCLLocationCoordinate2D()
        mapView.addAnnotation(annotation)
    }
    
    func createRestaurantRegion() {
        let region = MKCoordinateRegion(center: (viewModel as! MapRestaurantCellViewModel).transformLocationInCLLocationCoordinate2D(), span: MKCoordinateSpanMake(Constants.Numerics.kMapRestaurantRegionSpan, Constants.Numerics.kMapRestaurantRegionSpan))
        mapView.setRegion(region, animated: false)
    }
}

extension MapRestaurantCell {
    
    func setUpViews() {
        setUpMapView()
    }
    
    private func setUpMapView() {
        addSubview(mapView)
        mapView.delegate = self
        
        mapView.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.bottom.equalTo(self)
            make.trailing.equalTo(self)
        }
    }
}

extension MapRestaurantCell: MKMapViewDelegate {
    
}
