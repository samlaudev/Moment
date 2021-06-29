//
//  InternalMenuSectionModel.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/28.
//

import RxDataSources

struct InternalMenuSectionModel: SectionModelType {
    var title: String
    var footer: String?
    var items: [InternalMenuItemViewModel]

    init(original: InternalMenuSectionModel, items: [InternalMenuItemViewModel]) {
        self.init(title: original.title, footer: original.footer, items: items)
    }

    init(title: String, footer: String? = nil, items: [InternalMenuItemViewModel]) {
        self.title = title
        self.footer = footer
        self.items = items
    }
}
