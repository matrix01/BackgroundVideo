//
//  UIButton+Design.swift
//  testBackgroundVideo
//
//  Created by Milan Mia on 5/21/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    @IBInspectable var borderColor: UIColor {
        get {
            return self.borderColor
        }
        set {
            layer.borderColor = borderColor.CGColor
        }
    }
}
