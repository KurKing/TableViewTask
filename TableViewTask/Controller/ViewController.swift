//
//  ViewController.swift
//  TableViewTask
//
//  Created by Oleksiy on 20.02.2021.
//

import UIKit

class ViewController: UITableViewController, LikeButtonPressed {
    private(set) var data = [DataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SimpleTableViewCell.self, forCellReuseIdentifier: "simpleCell")
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "imageCell")
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "bg")!)
        tableView.separatorStyle = .none
        
        for i in [nil, UIImage(named: "anImage")!,nil, UIImage(named: "anImage")!] {
            data.append(
                DataModel(
                    avatarImage: UIImage(named: "catAvatar\(Int.random(in: 1...5))")!,
                    image: i,
                    statusImage: nil,
                    nickName: "KurKing",
                    text: "Lorem ipsum dolor sit amet",
                    time: "12:45 Uhr", likesCount: Int.random(in: 0...999))
            )
        }

        tableView.delaysContentTouches = false
    }
    
    //MARK: - delegate/data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if data[indexPath.row].image == nil {
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
