//
//  AppRouter.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/21.
//

import Foundation
import UIKit

final class AppRouter: AppRouting {
    static let share: AppRouter = .init()

    private var navigators: [String: Navigating] = [:]

    private init() { }

    func register(path: String, navigator: Navigating) {
        navigators[path] = navigator
    }

    func route(to url: URL?, from routingSource: RoutingSource?, using transitionType: TransitionType) {
        guard let url = url, let routingSource = routingSource as? UIViewController ?? UIApplication.shared.rootViewController else { return }
        let path = url.lastPathComponent
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        let parameters: [String: String] = (urlComponents.queryItems ?? []).reduce(into: [:]) { params, queryItem in
            params[queryItem.name] = queryItem.value
        }

        navigators[path]?.navigate(from: routingSource, using: transitionType, parameters: parameters)
    }
}
