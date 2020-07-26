//
//  MainMenuCollectionViewCell.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/19.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit
import SafariServices

//var fromViewController: UIViewController?

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
    
    public func configure(mainMenuData: [String]) {
        self.image.image = UIImage(named: mainMenuData[0])
        
        let tappy = MyUITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        self.image.addGestureRecognizer(tappy)
        tappy.link = mainMenuData[1]
    }
    
    @objc func imageTapped(tapGestureRecognizer: MyUITapGestureRecognizer)
    {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView

        guard let url = URL(string: tapGestureRecognizer.link) else { return }
        let safariViewController = SFSafariViewController(url: url)
        
        if let keyWindow = UIWindow.key {
            keyWindow.rootViewController?.present(safariViewController, animated: true, completion: nil)
        }
    }
}

class MyUITapGestureRecognizer: UITapGestureRecognizer {
    var link = String()
}
