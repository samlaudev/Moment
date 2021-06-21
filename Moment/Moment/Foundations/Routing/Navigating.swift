//
//  Navigating.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/21.
//

import UIKit

protocol Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String: String])
}

extension Navigating {
    func navigate(to destinationViewController: UIViewController, from sourceViewController: UIViewController, using transitionType: TransitionType) {
        switch transitionType {
        case .show:
            sourceViewController.show(destinationViewController, sender: nil)
        case .present:
            sourceViewController.present(destinationViewController, animated: true)
        }
    }
}
