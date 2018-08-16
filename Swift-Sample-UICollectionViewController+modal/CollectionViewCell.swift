//
//  CollectionViewCell.swift
//  Swift-Sample-UICollectionViewController+modal
//
//  Created by A10 Lab Inc. nobuy on 2018/07/12.
//  Copyright © 2018年 A10 Lab Inc. nobuy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    private let identifier = "cell"

    private var item: DataItem!

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.sectionFooterHeight = .leastNormalMagnitude
        tableView.sectionHeaderHeight = .leastNormalMagnitude
        tableView.rowHeight = 100
        tableView.clipsToBounds = true
        return tableView
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            self.tableView.contentOffset = CGPoint(x: 0, y: -20)
        }
    }

    private func initView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self

        contentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    func configureCell(with item: DataItem) {
        self.item = item
        tableView.reloadData()
    }
}

extension CollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.contents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = item.contents[indexPath.row]
        cell.backgroundColor = item.color
        return cell
    }
}
