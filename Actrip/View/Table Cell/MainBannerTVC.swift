//
//  MainBannerTVC.swift
//  Actrip
//
//  Created by Jimmy on 2020/07/23.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit
import SafariServices

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
            let tappy = MyUITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
            banner.isUserInteractionEnabled = true
            banner.addGestureRecognizer(tappy)
            tappy.link = newValue?.link ?? ""
            
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
    
    @objc func imageTapped(tapGestureRecognizer: MyUITapGestureRecognizer)
    {
        guard let url = URL(string: tapGestureRecognizer.link) else { return }
        let safariViewController = SFSafariViewController(url: url)
        
        if let keyWindow = UIWindow.key {
            keyWindow.rootViewController?.present(safariViewController, animated: true, completion: nil)
        }
    }
}
