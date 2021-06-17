//
//  BuildTargetTogglesDataStore.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/17.
//

enum BuildTargetToggle: TogglesType {
    case debug
    case `internal`
    case production
}

struct BuildTargetDataStore: TogglesDataStoreType {
    private let buildTargetToggle: BuildTargetToggle

    private init() {
        #if DEBUG
        buildTargetToggle = .debug
        #endif

        #if INTERNAL
        buildTargetToggle = .internal
        #endif

        #if PRODUCTION
        buildTargetToggle = .production
        #endif
    }

    static let shared: BuildTargetDataStore = .init()

    func isToggleOn(_ toggle: TogglesType) -> Bool {
        guard let toggle = toggle as? BuildTargetToggle else { return false }

        return toggle == buildTargetToggle
    }

    func update(toggle: TogglesType, value: Bool) {}
}
