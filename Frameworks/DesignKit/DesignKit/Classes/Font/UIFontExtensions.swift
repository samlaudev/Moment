//
//  UIFontExtensions.swift
//  DesignKit
//
//  Created by Sam Lau on 2021/6/4.
//

import UIKit

public extension UIFont {
    enum DesignKitTypography {
        public static let display1 = scaled(baseFont: .systemFont(ofSize: 42, weight: .semibold), forTextStyle: .largeTitle, maximumFactor: 1.5)
        public static let display2 = scaled(baseFont: .systemFont(ofSize: 36, weight: .semibold), forTextStyle: .largeTitle, maximumFactor: 1.5)
        public static let title1 = scaled(baseFont: .systemFont(ofSize: 24, weight: .semibold), forTextStyle: .title1)
        public static let title2 = scaled(baseFont: .systemFont(ofSize: 20, weight: .semibold), forTextStyle: .title2)
        public static let title3 = scaled(baseFont: .systemFont(ofSize: 18, weight: .semibold), forTextStyle: .title3)
        public static let title4 = scaled(baseFont: .systemFont(ofSize: 14, weight: .regular), forTextStyle: .headline)
        public static let title5 = scaled(baseFont: .systemFont(ofSize: 12, weight: .regular), forTextStyle: .subheadline)
        public static let body = scaled(baseFont: .systemFont(ofSize: 16, weight: .light), forTextStyle: .body)
        public static let bodyBold = scaled(baseFont: .systemFont(ofSize: 16, weight: .semibold), forTextStyle: .body)
        public static let caption = scaled(baseFont: .systemFont(ofSize: 14, weight: .light), forTextStyle: .caption1)
        public static let captionBold = scaled(baseFont: .systemFont(ofSize: 14, weight: .semibold), forTextStyle: .caption1)
        public static let small = scaled(baseFont: .systemFont(ofSize: 12, weight: .light), forTextStyle: .footnote)
        
        private static func scaled(baseFont: UIFont, forTextStyle textStyle: UIFont.TextStyle = .body, maximumFactor: CGFloat? = nil) -> UIFont{
            let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
            
            if let maximumFactor = maximumFactor {
                return fontMetrics.scaledFont(for: baseFont, maximumPointSize: baseFont.pointSize * maximumFactor)
            }
            
            return fontMetrics.scaledFont(for: baseFont)
        }
    }
}
