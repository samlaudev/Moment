//
//  InternalTogglesDataStore.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/17.
//

import Foundation

enum InternalToggle: String, TogglesType {
    case isLikeButtonForMomentEnable
}

struct InternalTogglesDataStore: TogglesDataStoreType {
    private let userDefaults: UserDefaults

    private init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        self.userDefaults.register(defaults: [InternalToggle.isLikeButtonForMomentEnable.rawValue: false])
    }

    static let shared: InternalTogglesDataStore = .init()

    func isToggleOn(_ toggle: TogglesType) -> Bool {
        guard let toggle = toggle as? InternalToggle else { return false }

        return userDefaults.bool(forKey: toggle.rawValue)
    }

    func update(toggle: TogglesType, value: Bool) {
        guard let toggle = toggle as? InternalToggle else { return }

        userDefaults.set(value, forKey: toggle.rawValue)
    }
}
