//
//  ViewController.swift
//  TableViewTask
//
//  Created by Oleksiy on 20.02.2021.
//

import UIKit

class ViewController: UITableViewController {
    fileprivate(set) var data = [
        DataModel(
            avatarImage: UIImage(named: "avatar"),
            image: nil,
            status: nil,
            nickName: "Bella",
            text: "Lorem ipsum dolor sit amet",
            time: "\(Int.random(in: 10...12)):\(Int.random(in: 10...59)) Uhr",
            likesCount: Int.random(in: 0...999)),
        DataModel(
            avatarImage: UIImage(named: "avatar"),
            image: nil,
            status: "💪",
            nickName: "Leo",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            time: "\(Int.random(in: 10...12)):\(Int.random(in: 10...59)) Uhr",
            likesCount: 1234
        ),
        DataModel(
            avatarImage: UIImage(named: "avatar"),
            image: UIImage(named: "anImage"),
            status: nil,
            nickName: "Charlie",
            text: "Lorem ipsum dolor sit amet",
            time: "\(Int.random(in: 10...12)):\(Int.random(in: 10...59)) Uhr",
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
        tableView.separatorStyle = .none
        
        tableView.delaysContentTouches = false
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
        
        //        if data[indexPath.row].status != nil {
        //            let cell: ReactionTableViewCell = tableView.dequeueReusableCell()
        //
        //            cell.setup(model: data[indexPath.row], index: indexPath)
        //            cell.delagate = self
        //
        //            return cell
        //        } else if data[indexPath.row].image == nil {
        let cell: SimpleTableViewCell = tableView.dequeueReusableCell()
        
        cell.setInfo(model: data[indexPath.row], indexPath: indexPath)
        cell.delegate = self
        
        return cell
        //        } else {
        //            let cell: ImageTableViewCell = tableView.dequeueReusableCell()
        //
        //            cell.setup(model: data[indexPath.row], index: indexPath)
        //            cell.delagate = self
        //
        //            return cell
        //        }
    }
}


