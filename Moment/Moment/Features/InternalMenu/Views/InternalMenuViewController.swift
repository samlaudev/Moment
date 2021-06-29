//
//  InternalMenuViewController.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/21.
//

import UIKit
import SnapKit
import RxDataSources

class InternalMenuViewController: BaseViewController {
    private var viewModel: InternalMenuViewModelType!
    private let tableView: UITableView = configure(UITableView(frame: .zero, style: .grouped)) {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 44

        $0.register(InternalMenuDescriptionCell.self, forCellReuseIdentifier: InternalMenuItemType.description.rawValue)
        $0.register(InternalMenuFeatureToggleCell.self, forCellReuseIdentifier: InternalMenuItemType.featureToggle.rawValue)
        $0.register(InternalMenuActionTriggerCell.self, forCellReuseIdentifier: InternalMenuItemType.actionTrigger.rawValue)
    }

    init(router: AppRouting = AppRouter.share) {
        super.init()

        viewModel = InternalMenuViewModel(router: router, routingSourceProvider: { [weak self] in
            self
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLayout()

        DispatchQueue.main.async {
            self.setupBindings()
        }
    }
}

private extension InternalMenuViewController {
    func setupUI() {
        title = viewModel.title
        view.addSubview(tableView)
    }

    func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setupBindings() {
        let rightBarButtonItem = UIBarButtonItem(systemItem: .done)
        rightBarButtonItem.rx.tap.subscribe(onNext: { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        })
        .disposed(by: disposeBag)
        navigationItem.rightBarButtonItem = rightBarButtonItem

        let dataSource = RxTableViewSectionedReloadDataSource<InternalMenuSectionModel> { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
            if let cell = cell as? InternalMenuCellType {
                cell.update(with: item)
            }

            return cell
        } titleForHeaderInSection: { dataSource, section in
            dataSource.sectionModels[section].title
        } titleForFooterInSection: { dataSource, section  in
            dataSource.sectionModels[section].footer
        }

        viewModel.sections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)

        tableView.rx.modelSelected(InternalMenuItemViewModel.self)
            .subscribe(onNext: { model in
                model.didSelectAction()
            })
            .disposed(by: disposeBag)
    }
}
