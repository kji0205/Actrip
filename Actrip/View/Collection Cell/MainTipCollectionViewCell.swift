//
//  MainTipCollectionViewCell.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/22.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class MainTipCollectionViewCell: UICollectionViewCell {

    @IBOutlet var image: UIImageView!
    
    static let identifier = "MainTipCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainTipCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(data: MainScreenDataBanner) {
//        print(data ?? "MainTipCollectionViewCell: no data")
        image.downloaded(from: data.imgurl, contentMode: .scaleAspectFit)
        
    }
}


