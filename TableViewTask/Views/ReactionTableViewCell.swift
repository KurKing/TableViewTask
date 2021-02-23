//
//  ReactionTableViewCell.swift
//  TableViewTask
//
//  Created by Oleksiy on 23.02.2021.
//

import UIKit

class ReactionTableViewCell: SimpleTableViewCell {
    
    @IBOutlet weak var reactionBackgroundView: UIView!
    @IBOutlet weak var reactionLabel: UILabel!
    
    override func setupUI() {
        super.setupUI()
        reactionBackgroundView.layer.cornerRadius = reactionBackgroundView.bounds.height / 2 
    }
    
    override func setInfo(model: DataModel, indexPath: IndexPath) {
        super.setInfo(model: model, indexPath: indexPath)
        reactionLabel.text = model.reaction 
    }
}
