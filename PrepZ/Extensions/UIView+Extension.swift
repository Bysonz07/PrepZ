//
//  UIView+Extension.swift
//  PrepZ
//
//  Created by Ellrica Jana on 17/06/21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
