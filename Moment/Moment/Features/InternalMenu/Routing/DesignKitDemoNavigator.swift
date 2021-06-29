//
//  DesignKitDemoNavigator.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/28.
//

import UIKit

struct DesignKitDemoNavigator: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        navigate(to: DesignKitDemoViewController(), from: viewController, using: transitionType)
    }
}
