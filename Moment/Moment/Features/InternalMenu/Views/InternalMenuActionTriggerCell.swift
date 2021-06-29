//
//  InternalMenuActionTriggerCell.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/23.
//

import UIKit

class InternalMenuActionTriggerCell: UITableViewCell, InternalMenuCellType {
    func update(with item: InternalMenuItemViewModel) {
        guard let item = item as? InternalMenuActionTriggerItemViewModel else { return }

        textLabel?.text = item.title
        accessoryType = .disclosureIndicator
    }
}
