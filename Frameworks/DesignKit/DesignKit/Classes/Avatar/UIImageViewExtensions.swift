//
//  UIImageViewExtension.swift
//  DesignKit
//
//  Created by Sam Lau on 2021/6/4.
//

import UIKit

public extension UIImageView {
    func asAvatar(cornerRadius: CGFloat = 4) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}
