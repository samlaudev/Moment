//
//  InternalMenuItemViewModel.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/22.
//

enum InternalMenuItemType: String {
    case description
    case featureToggle
    case actionTrigger
}

protocol InternalMenuItemViewModel {
    var type: InternalMenuItemType { get }
    var title: String { get }
    var didSelectAction: () -> Void { get }
}
