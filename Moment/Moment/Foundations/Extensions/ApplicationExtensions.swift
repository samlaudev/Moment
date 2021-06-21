//
//  ApplicationExtensions.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/21.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        let keyWindow = connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .first { $0.isKeyWindow }

        return keyWindow?.rootViewController
    }
}
