//
//  BaseViewController.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/28.
//

import RxSwift

class BaseViewController: UIViewController {
    lazy var disposeBag: DisposeBag = .init()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    // swiftlint:disable no_hardcoded_strings
    @available(*, unavailable, message: "We don't support init view controller from a nib.")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    // swiftlint:enable no_hardcoded_strings

    // swiftlint:disable no_hardcoded_strings
    @available(*, unavailable, message: "We don't support init view controller from a nib.")
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }
    // swiftlint:enable no_hardcoded_strings
}
