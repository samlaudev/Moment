//
//  InternalMenuDescriptionItemViewModel.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/22.
//

struct InternalMenuDescriptionItemViewModel: InternalMenuItemViewModel {
    let type: InternalMenuItemType = .description
    let title: String
    let didSelectAction: () -> Void = {}

    init(title: String) {
        self.title = title
    }
}
