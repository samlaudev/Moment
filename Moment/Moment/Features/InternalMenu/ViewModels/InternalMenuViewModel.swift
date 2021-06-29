//
//  InternalMenuViewModel.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/28.
//

import RxSwift

protocol InternalMenuViewModelType {
    var title: String { get }
    var sections: Observable<[InternalMenuSectionModel]> { get }
}

struct InternalMenuViewModel: InternalMenuViewModelType {
    let title: String = L10n.InternalMenu.area51
    let sections: Observable<[InternalMenuSectionModel]>

    init(router: AppRouting, routingSourceProvider: @escaping RoutingSourceProvider) {
        let appVersion = "\(L10n.InternalMenu.version)\(Bundle.main.object(forInfoDictionaryKey: L10n.InternalMenu.cfBundleVersion) as? String ?? "1.0")"

        let infoSection = InternalMenuSectionModel(
            title: L10n.InternalMenu.generalInfo,
            items: [InternalMenuDescriptionItemViewModel(title: appVersion)]
        )

        let designKitSection = InternalMenuSectionModel(
            title: L10n.InternalMenu.designKitDemo,
            items: [InternalMenuActionTriggerItemViewModel(title: L10n.InternalMenu.designKitDemo, didSelectAction: {
                router.route(to: UniversalLinks.designKitDemo.url, from: routingSourceProvider(), using: .show)
            })]
        )

        let featureTogglesSection = InternalMenuSectionModel(
            title: L10n.InternalMenu.featureToggles,
            items: [InternalMenuFeatureToggleItemViewModel(title: L10n.InternalMenu.likeButtonForMomentEnabled, toggleType: InternalToggle.isLikeButtonForMomentEnable)]
        )

        let toolsSection = InternalMenuSectionModel(
            title: L10n.InternalMenu.tools,
            items: [InternalMenuActionTriggerItemViewModel(title: L10n.InternalMenu.crashApp, didSelectAction: {
                // swiftlint:disable fatal_error_message
                fatalError()
                // swiftlint:enable fatal_error_message
            })]
        )

        sections = .just([
            infoSection,
            designKitSection,
            featureTogglesSection,
            toolsSection
        ])
    }
}
