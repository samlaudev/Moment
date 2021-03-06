//
//  InternalMenuFeatureToggleCell.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/23.
//

import UIKit
import RxSwift
import RxCocoa

class InternalMenuFeatureToggleCell: UITableViewCell, InternalMenuCellType {
    private let switchControl: UISwitch = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private var item: InternalMenuFeatureToggleItemViewModel?
    private lazy var disposeBag: DisposeBag = .init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        setupBindings()
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }

    func update(with item: InternalMenuItemViewModel) {
        guard let item = item as? InternalMenuFeatureToggleItemViewModel else { return }
        self.item = item

        textLabel?.text = item.title
        switchControl.isOn = item.isOn
    }
}

extension InternalMenuFeatureToggleCell {
    private func setupUI() {
        selectionStyle = .none
        accessoryView = switchControl
    }

    private func setupBindings() {
        switchControl.rx.isOn.changed
            .distinctUntilChanged()
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.item?.toggle(isOn: $0)
            })
            .disposed(by: self.disposeBag)
    }
}
