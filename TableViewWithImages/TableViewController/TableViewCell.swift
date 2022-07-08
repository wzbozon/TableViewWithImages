//
//  TableViewCell.swift
//  TableViewWithImages
//
//  Created by Denis Kutlubaev on 06.07.2022.
//

import UIKit

/// The height of the cells and images is not calculated, UITableView.automaticDimension is used
/// Images have a max width, have round corners
/// Image itself can have any size, it can be bigger than a cell or smaller
/// Images are reduced in size, but the content of the images is visible in full
class TableViewCell: UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: TableViewCell.self)
    }

    func configure(with imageName: String, _ maxImageWidthRatio: CGFloat) {
        guard let image = UIImage(named: imageName) else {
            assertionFailure("Image not found: \(imageName)")
            return
        }

        let screenWidth = UIScreen.main.bounds.size.width
        let maxImageWidth = screenWidth * maxImageWidthRatio

        imageWidthConstraint.constant = image.size.width > maxImageWidth ? maxImageWidth : image.size.width

        // This is necessary to resize UIImageView before assigning an image to it with scaleToFill content mode
        layoutIfNeeded()

        customImageView.image = image
    }

    @IBOutlet private var customImageView: UIImageView!
    @IBOutlet private var imageWidthConstraint: NSLayoutConstraint!
}
