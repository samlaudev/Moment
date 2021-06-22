//
//  UIColorExtensions.swift
//  DesignKit
//
//  Created by Sam Lau on 2021/6/4.
//

import UIKit

public extension UIColor {
    enum DesignKitPalette {
        public static let primaryColor = dynamicColor(lightColor: .init(hex: 0x0770e3), darkColor: .init(hex: 0x6d9feb))
        public static let backgroundColor = dynamicColor(lightColor: .white, darkColor: .black)
        public static let backgroundSecondaryColor = dynamicColor(lightColor: .init(hex: 0x1f2f8), darkColor: .init(hex: 0x1D1B20))
        public static let backgroundTertiaryColor = dynamicColor(lightColor: .white, darkColor: .init(hex: 0x2C2C2E))
        public static let lineColor = dynamicColor(lightColor: .init(hex: 0xcdcdd7), darkColor: .init(hex: 0x48484A))
        public static let textPrimaryColor = dynamicColor(lightColor: .init(hex: 0x111236), darkColor: .white)
        public static let textSecondaryColor = dynamicColor(lightColor: .init(hex: 0x68697f), darkColor: .init(hex: 0x8E8E93))
        public static let textTertiaryColor = dynamicColor(lightColor: .init(hex: 0x8f90a0), darkColor: .init(hex: 0x8E8E93))
        public static let textQuaternaryColor = dynamicColor(lightColor: .init(hex: 0xb2b2bf), darkColor: .init(hex: 0x8E8E93))
        
        private static func dynamicColor(lightColor: UIColor, darkColor: UIColor) -> UIColor {
            UIColor { $0.userInterfaceStyle == .dark ? darkColor : lightColor }
        }
    }
}

public extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: alpha)
    }
}
