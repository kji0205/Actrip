//
//  MainMenuCollectionViewCell.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/19.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class MainMenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet var image: UIImageView!
    
    static let identifier = "MainMenuCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainMenuCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.layer.borderColor = UIColor.red.cgColor
//        self.layer.borderWidth = 1
    }
    
    public func configure(imageSrc: String) {
        self.image.image = UIImage(named: imageSrc)
    }

}
