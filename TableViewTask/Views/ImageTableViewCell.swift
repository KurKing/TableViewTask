//
//  ImageTableViewCell.swift
//  TableViewTask
//
//  Created by Oleksiy on 23.02.2021.
//

import UIKit

class ImageTableViewCell: SimpleTableViewCell {
    
    @IBOutlet weak var bigImageView: UIImageView!
    
    override func setInfo(model: DataModel, indexPath: IndexPath) {
        super.setInfo(model: model, indexPath: indexPath)
        bigImageView.image = model.image
    }
    
    override func setupUI() {
        super.setupUI()
        bigImageView.layer.cornerRadius = Constants.cellImageCornerRadius
    }
}
