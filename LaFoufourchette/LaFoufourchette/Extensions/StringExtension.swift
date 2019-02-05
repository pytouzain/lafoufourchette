//
//  StringExtension.swift
//  LaFoufourchette
//
//  Created by Pierre-Yves Touzain on 09/01/2017.
//  Copyright © 2017 LaFoufourchette. All rights reserved.
//

import UIKit
import Foundation

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}
