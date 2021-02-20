//
//  ViewController.swift
//  TableViewTask
//
//  Created by Oleksiy on 20.02.2021.
//

import UIKit

class ViewController: UITableViewController, LikeButtonPressed {
    private var data = [
        DataModel(
            avatarImage: UIImage(named: "catAvatar1")!,
            image: nil,
            status: nil,
            nickName: "Bella",
            text: "Lorem ipsum dolor sit amet",
            time: "\(Int.random(in: 10...12)):\(Int.random(in: 10...59)) Uhr",
            likesCount: Int.random(in: 0...999)),
        DataModel(
            avatarImage: UIImage(named: "catAvatar2")!,
            image: nil,
            status: "😺",
            nickName: "Leo",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            time: "\(Int.random(in: 10...12)):\(Int.random(in: 10...59)) Uhr",
            likesCount: 1234
        ),
        DataModel(
            avatarImage: UIImage(named: "catAvatar3")!,
            image: UIImage(named: "anImage")!,
            status: nil,
            nickName: "Charlie",
            text: "Lorem ipsum dolor sit amet",
            time: "\(Int.random(in: 10...12)):\(Int.random(in: 10...59)) Uhr",
            likesCount: 2000000
        )
    ]
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SimpleTableViewCell.self, forCellReuseIdentifier: "simpleCell")
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(ReactionTableViewCell.self, forCellReuseIdentifier: "reactionCell")
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "bg")!)
        tableView.separatorStyle = .none

        tableView.delaysContentTouches = false
    }
    
    //MARK: - delegate/data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if data[indexPath.row].status != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reactionCell", for: indexPath) as! SimpleTableViewCell
            
            cell.setup(with: data[indexPath.row], index: indexPath.row)
            cell.delagate = self

            return cell
        } else if data[indexPath.row].image == nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath) as! SimpleTableViewCell
            
            cell.setup(with: data[indexPath.row], index: indexPath.row)
            cell.delagate = self

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! SimpleTableViewCell
            
            cell.setup(with: data[indexPath.row], index: indexPath.row)
            cell.delagate = self

            return cell
        }
    }
    
    //MARK: - LikeButtonPressed
    func likeButtonPressed(with index: Int) {
        data[index].likesCount += 1
        tableView.reloadData()
    }
}
