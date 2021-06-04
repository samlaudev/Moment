//
//  UIButtonExtensions.swift
//  DesignKit
//
//  Created by Sam Lau on 2021/6/4.
//

import UIKit

public extension UIButton {
    func asStarFavoriteButton(pointSize: CGFloat = 18,
                              weight: UIImage.SymbolWeight = .semibold,
                              scale: UIImage.SymbolScale = .default,
                              fillColor: UIColor = .init(hex: 0xf1c40f)) {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
        let starImage = UIImage(systemName: "star", withConfiguration: symbolConfiguration)
        setImage(starImage, for: .normal)
        let starFillImage = UIImage(systemName: "star.fill", withConfiguration: symbolConfiguration)
        setImage(starFillImage, for: .selected)
        tintColor = fillColor
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
}

private extension UIButton {
    @objc
    func touchUpInside(sender: UIButton) {
        isSelected = !isSelected
    }
}
