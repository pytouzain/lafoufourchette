//
//  ApiHandler.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

public class ApiHandler: NSObject {
    public static let instance:ApiHandler = ApiHandler()
    private override init() {}
    
    private func request(url: URLConvertible, method: HTTPMethod, parameters: Parameters?, success: @escaping (JSON)->(), failure: @escaping (Error)->()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func getRestaurantDetails(url: URLConvertible, success: @escaping (JSON)->(), failure: @escaping (Error)->()) {
        request(url: url, method: .get, parameters: nil, success: success, failure: failure)
    }
}
