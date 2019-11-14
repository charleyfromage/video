//
//  NSObject+Helpers.swift
//  video
//
//  Created by Fromage Charley on 14/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    class var bundle: Bundle {
        return Bundle(for: self)
    }
}
