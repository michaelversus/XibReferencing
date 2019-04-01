//
//  Array+Extensions.swift
//  NibLoadingSwift
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 01/04/2019.
//  Copyright © 2019 Karagiorgos, Michalis, Vodafone Greece. All rights reserved.
//

import Foundation

extension Array {
    func objectsOfType<T>(type:T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
