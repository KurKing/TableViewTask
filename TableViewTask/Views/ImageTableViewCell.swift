//
//  ImageTableViewCell.swift
//  TableViewTask
//
//  Created by Oleksiy on 20.02.2021.
//

import UIKit
import SnapKit

class ImageTableViewCell: SimpleTableViewCell{

    let bigImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func setup(with model: DataModel, index: Int) {
        super.setup(with: model, index: index)
        if let image = model.image {
            bigImageView.image = image
        }
    }

    override func addConstraints() {
        super.addConstraints()

        bigImageView.snp.makeConstraints {
            $0.height.equalTo(200)
            
            $0.top.equalTo(messageTextLabel.snp.bottom).offset(10)
            $0.leading.equalTo(avatar.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }

    override func addSubviews() {
        super.addSubviews()
        backgroundCellView.addSubview(bigImageView)
    }
}
