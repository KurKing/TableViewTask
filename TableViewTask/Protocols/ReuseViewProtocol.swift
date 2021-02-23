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

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(NSStringFromClass(self).split(separator: ".").last!)
    }
}

extension SimpleTableViewCell: NibLoadableView {
}

