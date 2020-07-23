//
//  MainBannerTVC.swift
//  Actrip
//
//  Created by Jimmy on 2020/07/23.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class MainBannerTVC: UITableViewCell {

    @IBOutlet weak var banner: UIImageView!
    
    static let identifier = "MainBannerTVC"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainBannerTVC", bundle: nil)
    }
    
    private var _mainScreenDataBanner: MainScreenDataBanner?
    
    public var mainScreenDataBanner: MainScreenDataBanner? {
        get {
            return _mainScreenDataBanner
        }
        set {
            banner.downloaded(from: newValue?.imgurl ?? "", contentMode: .scaleAspectFit)
            _mainScreenDataBanner = newValue
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
