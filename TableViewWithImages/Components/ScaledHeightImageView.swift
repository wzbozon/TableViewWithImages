//
//  ScaledHeightImageView.swift
//  TableViewWithImages
//
//  Created by Denis Kutlubaev on 06.07.2022.
//

import UIKit

/// Used to automatically scale UIImageView to UIImage size in a UITableView with AutomaticDimension height
class ScaledHeightImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        guard let image = image else { return .zero }

        let imageWidth = image.size.width
        let imageHeight = image.size.height
        let viewWidth = frame.size.width

        let ratio = viewWidth / imageWidth
        let scaledHeight = imageHeight * ratio

        return CGSize(width: viewWidth, height: scaledHeight)
    }
}
