//
//  MainPlanTVC.swift
//  Actrip
//
//  Created by Jimmy on 2020/07/23.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class MainPlanTVC: UITableViewCell {

    static let identifier = "MainPlanTVC"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainPlanTVC", bundle: nil)
    }
    
    private var _mainPlan: MainPlan?
    
    public var mainPlan: MainPlan? {
        get {
            return _mainPlan
        }
        set {
            _mainPlan = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
