//
//  UIWindowExtension.swift
//  Actrip
//
//  Created by Jimmy on 2020/07/25.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
