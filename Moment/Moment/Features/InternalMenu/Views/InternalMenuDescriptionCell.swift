//
//  InternalMenuDescriptionCell.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/23.
//

import UIKit

class InternalMenuDescriptionCell: UITableViewCell, InternalMenuCellType {
    func update(with item: InternalMenuItemViewModel) {
        guard let item = item as? InternalMenuDescriptionItemViewModel else { return }

        selectionStyle = .none
        textLabel?.text = item.title
    }
}
