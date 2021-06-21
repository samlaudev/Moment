//
//  AppRouting.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/21.
//

import Foundation

protocol AppRouting {
    func register(path: String, navigator: Navigating)
    func route(to url: URL?, from routingSource: RoutingSource?, using transitionType: TransitionType)
}
