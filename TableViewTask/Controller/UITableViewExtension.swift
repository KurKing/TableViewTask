//
//  UITableViewExtension.swift
//  TableViewTask
//
//  Created by Oleksiy on 22.02.2021.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_: T.Type) where T: ReusableCell, T: NibLoadableView {
        register(UINib(nibName: T.nibName, bundle: Bundle(for: T.self)), forCellReuseIdentifier: T.defaultReuseIdentifier)        
    }
 
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
