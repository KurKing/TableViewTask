//
//  ViewController.swift
//  TableViewTask
//
//  Created by Oleksiy on 20.02.2021.
//

import UIKit

class ViewController: UITableViewController {
    // TODO
    private(set) var data = [
        DataModel(
            avatarImage: UIImage(named: "avatar"),
            image: nil,
            reaction : nil,
            nickName: "KurKing",
            text: "Lorem ipsum dolor sit amet",
            date: Date(),
            likesCount: Int.random(in: 0...999)),
        DataModel(
            avatarImage: UIImage(named: "avatar"),
            image: nil,
            reaction : "💪",
            nickName: "KurKing",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            date: Date(),
            likesCount: 1234
        ),
        DataModel(
            avatarImage: UIImage(named: "avatar"),
            image: UIImage(named: "anImage"),
            reaction : nil,
            nickName: "KurKing",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            date: Date(),
            likesCount: 2000000
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCell(SimpleTableViewCell.self)
//        tableView.registerCell(ImageTableViewCell.self)
//        tableView.registerCell(ReactionTableViewCell.self)        
        if let backgroundImage = UIImage(named: "bg"){
            tableView.backgroundView = UIImageView(image: backgroundImage)
        }
    }
}

//MARK: - LikeButtonPressed
extension ViewController: LikeButtonPressed {
    func likeButtonPressed(index: IndexPath) {
        data[index.row].likesCount += 1
        tableView.reloadRows(at: [index], with: .none)
    }
}

//MARK: - DataSource
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CellsSetupProtocol?
        
//        if data[indexPath.row].reaction  != nil {
//            cell = tableView.dequeueReusableCell(type: ReactionTableViewCell.self)
//        } else if data[indexPath.row].image == nil {
//            cell = tableView.dequeueReusableCell(type: SimpleTableViewCell.self)
//        } else {
//            cell = tableView.dequeueReusableCell(type: ImageTableViewCell.self)
//        }
        
        cell = tableView.dequeueReusableCell(type: SimpleTableViewCell.self)
        
        cell?.setInfo(model: data[indexPath.row], indexPath: indexPath)
        cell?.delegate = self
        
        return cell as? UITableViewCell ?? UITableViewCell()
    }
}


