//
//  MainTipTableViewCell.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/22.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit
import SafariServices

class MainTipTableViewCell: UITableViewCell {

    @IBOutlet weak var tip1: UIImageView!
    @IBOutlet weak var tip2: UIImageView!
    @IBOutlet weak var tip3: UIImageView!
    @IBOutlet weak var tip4: UIImageView!
    
    @IBOutlet weak var tag1: UIImageView!
    @IBOutlet weak var tag2: UIImageView!
    @IBOutlet weak var tag3: UIImageView!
    @IBOutlet weak var tag4: UIImageView!
    
    static let identifier = "MainTipTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainTipTableViewCell", bundle: nil)
    }
    
    private var _mainTipData: MainTip?
    
    public var mainTipData: MainTip? {
        get {
            return _mainTipData
        }
        set {
            _mainTipData = newValue
//            self.title.text = newValue?.titlename
//            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFooter: UICollectionView!
    
    fileprivate func makeLink(image: UIImageView, link: String) {
        let tappy = MyUITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tappy)
        tappy.link = link
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeLink(image: tip1, link: "https://cafe.naver.com/actrip/375")
        makeLink(image: tip2, link: "https://actrip.co.kr/eatlist")
        makeLink(image: tip3, link: "https://cafe.naver.com/ArticleList.nhn?search.clubid=29998302&search.menuid=40&search.boardtype=L")
        makeLink(image: tip4, link: "https://cafe.naver.com/ArticleList.nhn?search.clubid=29998302&search.menuid=21&search.boardtype=W")
//        makeLink(image: tag1, link: "https://cafe.naver.com/actrip/375")
//        makeLink(image: tag2, link: "https://cafe.naver.com/actrip/375")
//        makeLink(image: tag3, link: "https://cafe.naver.com/actrip/375")
//        makeLink(image: tag4, link: "https://cafe.naver.com/actrip/375")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
//
//extension MainTipTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
//{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return mainTipData?.data.count ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainTipCollectionViewCell.identifier, for: indexPath) as! MainTipCollectionViewCell
//        if mainTipData != nil, let banner = mainTipData?.data[indexPath.row] {
//            cell.configure(data: banner)
//        }
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        var numberOfRow = 3.8
//
//        // 가로 모드
//        if (UIDevice.current.orientation.isLandscape) {
//            numberOfRow = 5.5
//        } else {
//            numberOfRow = 3.2
//        }
//
//        return CGSize(width: collectionView.bounds.width/CGFloat(numberOfRow), height: collectionView.bounds.height/2.2)
//
//    }
//
//    // 테이블뷰셀의 여백
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
//}
