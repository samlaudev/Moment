//
//  RoutingSource.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/21.
//

import UIKit

protocol RoutingSource { }

typealias RoutingSourceProvider = () -> RoutingSource?

extension UIViewController: RoutingSource { }
