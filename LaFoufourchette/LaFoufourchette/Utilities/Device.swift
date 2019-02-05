//
//  Device.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 08/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit

struct ScreenSize
{
    static let width         = UIScreen.main.bounds.size.width
    static let height        = UIScreen.main.bounds.size.height
    static let maxLength    = max(ScreenSize.width, ScreenSize.height)
    static let minLength    = min(ScreenSize.width, ScreenSize.height)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let IS_IPHONE_7          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let IS_IPHONE_7P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1366.0
}
