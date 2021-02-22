//
//  SimpleTableViewCell.swift
//  TableViewTask
//
//  Created by Oleksiy on 20.02.2021.
//

import UIKit
import SnapKit

class SimpleTableViewCell: UITableViewCell {
    
    var index: Int?
    weak var delagate: LikeButtonPressed?

    //MARK: - Subviews
    let backgroundCellView: UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 10
        uiView.clipsToBounds = true
        uiView.backgroundColor = .white
        
        return uiView
    }()

    let avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()

    let nickNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        
        return label
    }()

    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    let messageTextLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()

    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("👍", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        
        return button
    }()

    let likeLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        
        return label
    }()
    
    //MARK: - Constraints
    func addConstraints(){
        avatar.snp.makeConstraints {
            $0.size.equalTo(40)
            
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(10)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalTo(avatar.snp.trailing).offset(10)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(avatar.snp.trailing).offset(10)
        }
        
        separatorLine.snp.makeConstraints {
            $0.height.equalTo(1)
            
            $0.top.equalTo(dateLabel.snp.bottom).offset(7)
            $0.leading.equalTo(avatar.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        messageTextLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.leading.equalTo(avatar.snp.trailing).offset(10)
            $0.top.equalTo(separatorLine.snp.bottom).offset(7)
            $0.bottomMargin.lessThanOrEqualTo(-10)
        }
        
        likeButton.snp.makeConstraints {
            $0.size.equalTo(40)
            
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalTo(avatar.snp.bottom).offset(3)
        }
        
        likeLabel.snp.makeConstraints {
            $0.centerX.equalTo(likeButton)
            $0.topMargin.equalTo(likeButton.snp.bottom).offset(9)
            $0.bottom.lessThanOrEqualToSuperview().offset(-7)
        }
        
        backgroundCellView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
    }

    func addShadow(to view: UIView, opacity: Float, x: Int, y: Int, radius: CGFloat){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowOffset = CGSize(width: x, height: y)
        view.layer.shadowRadius = radius
    }
    
    //MARK: - Setup functions
    func setup(with model: DataModel, index: Int){
        avatar.image = model.avatarImage
        nickNameLabel.text = model.nickName
        dateLabel.text = model.time
        messageTextLabel.text = model.text
        
        if model.likesCount > 1000000 {
            likeLabel.text = "\(round(Double(model.likesCount)/100000.0)/10.0)M"
        } else if model.likesCount > 1000 {
            likeLabel.text = "\(round(Double(model.likesCount)/100.0)/10.0)k"
        } else {
            likeLabel.text = "\(model.likesCount)"
        }
        
        
        self.index = index
    }
    
    func addSubviews(){
        contentView.addSubview(backgroundCellView)
        
        backgroundCellView.addSubview(avatar)
        backgroundCellView.addSubview(nickNameLabel)
        backgroundCellView.addSubview(dateLabel)
        backgroundCellView.addSubview(separatorLine)
        backgroundCellView.addSubview(messageTextLabel)
        backgroundCellView.addSubview(likeLabel)
        backgroundCellView.addSubview(likeButton)
    }

    func setupUI(){
        selectionStyle = .none
        backgroundColor = .clear
        isUserInteractionEnabled = true
        
        addShadow(to: self, opacity: 0.4, x: 2, y: 3, radius: 6)
        
        addSubviews()
        addConstraints()
        
        likeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton){
        if let index = index {
            delagate?.likeButtonPressed(with: index)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
