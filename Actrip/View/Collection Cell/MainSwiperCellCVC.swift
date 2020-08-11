//
//  MainCellCVC.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/28.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit
import SafariServices

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
        banner.downloaded(from: data.imgurl, contentMode: .scaleAspectFill)
        guard let url = URL(string: data.link) else { return }
        let safariViewController = SFSafariViewController(url: url)
        
        banner.onClick {
            if let keyWindow = UIWindow.key {
                keyWindow.rootViewController?.present(safariViewController, animated: true, completion: nil)
            }
        }
    }
}
