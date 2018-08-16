//
//  ViewController.swift
//  Swift-Sample-UICollectionViewController+modal
//
//  Created by A10 Lab Inc. nobuy on 2018/07/12.
//  Copyright © 2018年 A10 Lab Inc. nobuy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let items: [DataItem] = [
        DataItem(title: "Blue", color: .blue, contents: ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"]),
        DataItem(title: "Green", color: .green, contents: ["1", "b", "3", "d", "5", "f", "7", "h", "9", "j", "11", "l", "13", "n"]),
        DataItem(title: "Yellow", color: .yellow, contents: ["A", "b", "C", "d", "E", "f", "G", "h", "I", "j", "K", "l", "M", "n"]),
        DataItem(title: "Cyan", color: .cyan, contents: ["a", "b", "c", "d", "e", "f"]),
        DataItem(title: "Magenta", color: .magenta, contents: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"]),
        DataItem(title: "Orange", color: .orange, contents: ["h", "i", "j", "k", "l", "m", "n"]),
        DataItem(title: "Purple", color: .purple, contents: ["f", "g", "h", "i", "j", "k", "l", "m", "1", "2", "3"]),
        DataItem(title: "DarkGray", color: .darkGray, contents: ["a", "b", "1", "d", "e", "2", "g", "h", "3", "j", "k", "4", "m", "n"])
    ]

    private let item: DataItem

    let presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("modal", for: UIControlState())
        button.setTitleColor(.blue, for: UIControlState())
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()

    init(item: DataItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = item.color
        navigationItem.title = item.title
        presentButton.addTarget(self, action: #selector(self.onPresentTapped), for: .touchUpInside)

        view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        presentButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        presentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @objc func onPresentTapped(_ sender: UIButton) {
        let vc = CollectionViewController(items: items)
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}

