//
//  ReactionTableViewCell.swift
//  TableViewTask
//
//  Created by Oleksiy on 20.02.2021.
//

import UIKit

class ReactionTableViewCell: SimpleTableViewCell{
    
    let circleView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 0, green: 1, blue: 0.65, alpha: 1)
        
        return view
    }()
    
    let reactionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    override func setup(model: DataModel, index: IndexPath) {
        super.setup(model: model, index: index)
        if let reaction = model.status {
            reactionLabel.text = reaction
        }
    }

    override func addConstraints() {
        super.addConstraints()
        
        circleView.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.trailing.equalToSuperview().offset(-15)
            $0.top.equalTo(separatorLine.snp.bottom).offset(7)
        }
        
        messageTextLabel.snp.updateConstraints {
            $0.trailing.equalToSuperview().offset(-65)
        }
        
        reactionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    override func addSubviews() {
        super.addSubviews()
        backgroundCellView.addSubview(circleView)
        circleView.addSubview(reactionLabel)
    }
}

