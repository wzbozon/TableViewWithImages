//
//  TableViewController.swift
//  TableViewWithImages
//
//  Created by Denis Kutlubaev on 06.07.2022.
//

import UIKit

/// TableView with images, that are reduced in size if necessary, but the content of the images is visible in full
class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell

        cell.configure(with: images[indexPath.row], Constants.maxImageWidthRatio)

        return cell
    }

    private func setupTableView() {
        let nib = UINib(nibName: Constants.cellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }

    private let images: [String] = {
        let numbers = 1...8
        return numbers.map { "\($0).jpg" }
    }()

    private enum Constants {
        static let estimatedRowHeight: CGFloat = 200
        static let cellNibName = "TableViewCell"

        /// Max width of an image in a cell
        static let maxImageWidthRatio: CGFloat = 0.8
    }
}
