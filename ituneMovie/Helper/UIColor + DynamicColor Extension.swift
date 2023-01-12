//
//  UIColor + DynamicColor Extension.swift
//  ituneMovie
//
//  Created by Giap on 26/12/2022.
//

import Foundation
import UIKit

extension UIColor {
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return light }
        print("Apptheme dynamicColor", light, dark)
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
}
