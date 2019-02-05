//
//  ImageSet.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageSet: NSObject {

    var imageStringUrl612x344: String = ""
    var imageStringUrl480x270: String = ""
    var imageStringUrl240x135: String = ""
    var imageStringUrl664x374: String = ""
    var imageStringUrl1350x729: String = ""
    var label: String = ""
    
    init(json: JSON) {
        imageStringUrl612x344 = json["612x344"].string ?? ""
        imageStringUrl480x270 = json["480x270"].string ?? ""
        imageStringUrl240x135 = json["240x135"].string ?? ""
        imageStringUrl664x374 = json["664x374"].string ?? ""
        imageStringUrl1350x729 = json["1350x729"].string ?? ""
        label = json["label"].string ?? ""
    }
    
    func getStringUrlAccordingToCurrentDevice() -> String {
        if DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPHONE_5 {
            return imageStringUrl612x344
        } else if DeviceType.IS_IPHONE_6 || DeviceType.IS_IPHONE_7 {
            return imageStringUrl664x374
        } else if DeviceType.IS_IPHONE_6P || DeviceType.IS_IPHONE_7P || DeviceType.IS_IPAD || DeviceType.IS_IPAD_PRO {
            return imageStringUrl1350x729
        }
        return ""
    }
}
