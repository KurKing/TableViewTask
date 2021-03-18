//
//  ReuseNibLoadedView.swift
//  TableViewTask
//
//  Created by Oleksiy on 18.03.2021.
//

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        let name = NSStringFromClass(self)
                        .split(separator: ".")
                        .last ?? "default"
        return String(name)
    }
}

extension UITableViewCell: NibLoadableView {
}
