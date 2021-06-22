//
//  InternalMenuFeatureToggleItemViewModel.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/22.
//

struct InternalMenuFeatureToggleItemViewModel: InternalMenuItemViewModel {
    let type: InternalMenuItemType = .featureToggle
    let title: String
    let didSelectAction: () -> Void = {}

    private let toggleType: TogglesType
    private let togglesDataStore: TogglesDataStoreType

    init(title: String, toggleType: TogglesType, togglesDataStore: TogglesDataStoreType = InternalTogglesDataStore.shared) {
        self.title = title
        self.toggleType = toggleType
        self.togglesDataStore = togglesDataStore
    }

    var isOn: Bool {
        togglesDataStore.isToggleOn(toggleType)
    }

    func toggle(isOn: Bool) {
        togglesDataStore.update(toggle: toggleType, value: isOn)
    }
}
