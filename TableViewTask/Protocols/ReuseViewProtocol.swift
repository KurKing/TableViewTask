//
//  ReuseViewProtocol.swift
//  TableViewTask
//
//  Created by Oleksiy on 22.02.2021.
//

import UIKit

protocol ReusableCell: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableCell where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ReusableCell {
}

