//
//  CellsSetupProtocol.swift
//  TableViewTask
//
//  Created by Oleksiy on 26.02.2021.
//

import UIKit

protocol CellsSetupProtocol {
    var delegate: LikeButtonPressed? { set get }
    func setInfo(model: DataModel, indexPath: IndexPath)
}
