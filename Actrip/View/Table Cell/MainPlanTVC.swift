//
//  MainPlanTVC.swift
//  Actrip
//
//  Created by Jimmy on 2020/07/23.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit
import SafariServices

class MainPlanTVC: UITableViewCell {
    
    @IBOutlet weak var planImage1: UIImageView!
    @IBOutlet weak var planImage2: UIImageView!
    @IBOutlet weak var planImage3: UIImageView!
    @IBOutlet weak var planImage4: UIImageView!
    
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
    
    fileprivate func makeLink(image: UIImageView, link: String) {
        let tappy = MyUITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tappy)
        tappy.link = link
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        makeLink(image: planImage1, link: "https://cafe.naver.com/actrip/381")
        makeLink(image: planImage2, link: "https://cafe.naver.com/actrip/380")
        makeLink(image: planImage3, link: "https://cafe.naver.com/actrip/379")
        makeLink(image: planImage4, link: "https://actrip.co.kr/eatlist")
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
