//
//  InternalMenuActionTriggerItemViewModel.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/22.
//

class InternalMenuActionTriggerItemViewModel: InternalMenuItemViewModel {
    let type: InternalMenuItemType = .actionTrigger
    let title: String
    let didSelectAction: () -> Void

    init(title: String, didSelectAction:@escaping () -> Void = {}) {
        self.title = title
        self.didSelectAction = didSelectAction
    }
}
