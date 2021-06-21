//
//  InternalMenuNavigator.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/21.
//

import UIKit

struct InternalMenuNavigator: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        let navigationController = UINavigationController(rootViewController: InternalMenuViewController())
        navigate(to: navigationController, from: viewController, using: transitionType)
    }
}
