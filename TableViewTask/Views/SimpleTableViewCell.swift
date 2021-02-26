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
    
    struct Constants {
        static let cellCornerRadius: CGFloat = 10
        static let cellImageCornerRadius: CGFloat = 7
    }
    
    //MARK: - IBOutlets / IBActions
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarImageShadow: UIView!
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
        avatarImageView.image = model.avatarImage
        nickNameLabel.text = model.nickName
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dateLabel.text = formatter.string(from: model.date)
        
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
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
        avatarImageShadow.layer.cornerRadius = avatarImageView.bounds.height / 2
        addShadow(view: avatarImageShadow, opacity: 0.3, x: 1, y: 2, radius: 4)
        
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
