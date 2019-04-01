//
//  UIView+Extensions.swift
//  NibLoadingSwift
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 01/04/2019.
//  Copyright © 2019 Karagiorgos, Michalis, Vodafone Greece. All rights reserved.
//

import UIKit

enum Tag: Int {
    case nibView = 600
}

extension UIView {
    
    class func loadInstanceFromNib() -> UIView {
        let viewType = String(describing: self)
        guard let elements = Bundle.main.loadNibNamed(viewType, owner: nil, options: nil) else {
            fatalError("Failed to load nib with class name: \(viewType)")
        }
        guard let filteredViews = (elements as? [UIView])?.objectsOfType(type: self) else { fatalError("Failed to find objects of type: \(viewType)") }
        guard let nibView = filteredViews.first else { fatalError("Failed to find nibView") }
        return nibView
    }
    
    open override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        if self.tag == Tag.nibView.rawValue {
            let realView = type(of: self).loadInstanceFromNib()
            realView.frame = self.frame
            realView.alpha = alpha
            realView.backgroundColor = self.backgroundColor
            realView.autoresizingMask = self.autoresizingMask
            realView.autoresizesSubviews = self.autoresizesSubviews
            self.subviews.forEach {
                realView.addSubview($0)
            }
            return realView
        }
        return super.awakeAfter(using: aDecoder)
    }
    
}
