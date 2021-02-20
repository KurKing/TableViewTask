//
//  SimpleTableViewCell.swift
//  TableViewTask
//
//  Created by Oleksiy on 20.02.2021.
//

import UIKit
import SnapKit

class SimpleTableViewCell: UITableViewCell {
    
    //MARK: - backgroundCellView
    let backgroundCellView: UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 10
        uiView.clipsToBounds = true
        uiView.backgroundColor = .white
        
        return uiView
    }()
    
    //MARK: - Avatar image
    let avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    //MARK: - NickName label
    let nickNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Date label
    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        
        return label
    }()
    
    //MARK: - Separator line
    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    //MARK: - messageTextLabel
    let messageTextLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    //MARK: - Like button
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("👍", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        
        return button
    }()
    
    //MARK: - Like label
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
    
    //MARK: - Shadow
    func addShadow(to view: UIView, opacity: Float, x: Int, y: Int, radius: CGFloat){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowOffset = CGSize(width: x, height: y)
        view.layer.shadowRadius = radius
    }
    
    //MARK: - AddSubViews
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
    
    //MARK: - Setter
    func setup(with model: DataModel, index: Int){
        avatar.image = model.avatarImage
        nickNameLabel.text = model.nickName
        dateLabel.text = model.time
        messageTextLabel.text = model.text
        likeLabel.text = "\(model.likesCount)"
        
        self.index = index
    }
    
    var index: Int!
    
    //MARK: - Delegate
    var delagate: LikeButtonPressed?
    
    @objc func buttonPressed(_ sender: UIButton){
        delagate?.likeButtonPressed(with: index)
    }
    
    //MARK: - SetupUI
    func setupUI(){
        selectionStyle = .none
        backgroundColor = .clear
        isUserInteractionEnabled = true
        
        addShadow(to: self, opacity: 0.4, x: 2, y: 3, radius: 6)
        
        addSubviews()
        addConstraints()
        
        likeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    //MARK: - init
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
