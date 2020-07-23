//
//  MainCellCVC.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/28.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class MainSwiperCellCVC: UICollectionViewCell {

    @IBOutlet weak var banner: UIImageView!
    
    static let identifier = "MainSwiperCellCVC"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainSwiperCellCVC", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(data: MainScreenDataBanner) {
//        print(data ?? "MainSwiperCellCVC: no data")
//        self.banner.image = UIImage(named: data.imgurl)
        banner.downloaded(from: data.imgurl, contentMode: .scaleAspectFit)

    }
}
