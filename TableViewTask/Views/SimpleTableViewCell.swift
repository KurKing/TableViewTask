//
//  SimpleTableViewCell.swift
//  TableViewTask
//
//  Created by Oleksiy on 23.02.2021.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {
    
    var indexPath: IndexPath?
    weak var delegate: LikeButtonPressed?
    
    //MARK: - IBOutlets / IBActions
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if let indexPath = indexPath {
            delegate?.likeButtonPressed(index: indexPath)
        }
    }
    
    //MARK: - Setup functions
    func setInfo(model: DataModel, indexPath: IndexPath){
        avatarImage.image = model.avatarImage
        nickNameLabel.text = model.nickName
        dateLabel.text = model.time
        commentLabel.text = model.text
        
        if model.likesCount > 1000000 {
            likeLabel.text = "\(round(Double(model.likesCount)/100000.0)/10.0)M"
        } else if model.likesCount > 1000 {
            likeLabel.text = "\(round(Double(model.likesCount)/100.0)/10.0)k"
        } else {
            likeLabel.text = "\(model.likesCount)"
        }
        
        self.indexPath = indexPath
    }
    
    func setupUI(){
        cellBackgroundView.layer.cornerRadius = Constants.cellCornerRadius
        addShadow(view: cellBackgroundView, opacity: 0.4, x: 2, y: 3, radius: 6)
        
        avatarImage.layer.cornerRadius = avatarImage.bounds.height / 2
    }
    
    func addShadow(view: UIView, opacity: Float, x: Int, y: Int, radius: CGFloat){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowOffset = CGSize(width: x, height: y)
        view.layer.shadowRadius = radius
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
}
