//
//  UIViewExtension.swift
//  TableViewTask
//
//  Created by Oleksiy on 27.02.2021.
//

import UIKit

extension UIView {
    func addShadow(view: UIView, opacity: Float, x: Int, y: Int, radius: CGFloat){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowOffset = CGSize(width: x, height: y)
        view.layer.shadowRadius = radius
    }
}
