//
//  UITableViewExtension.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/24.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

extension UITableView {
     /// 전제조건 : cellType의 이름과 같은 xib파일이 있어야 함
    public func register(_ cellType: UITableViewCell.Type) {
        let cellClassName = String(describing:cellType)
        let nib = UINib(nibName: cellClassName, bundle: Bundle(for: cellType))
        register(nib, forCellReuseIdentifier: cellClassName)
    }

    public func register(cellTypes: [UITableViewCell.Type]) {
        cellTypes.forEach { register($0) }
    }
}
