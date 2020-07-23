//
//  MainTipTableViewCell.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/22.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class MainTipTableViewCell: UITableViewCell {

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        collectionView.register(MainTipCollectionViewCell.nib(), forCellWithReuseIdentifier: MainTipCollectionViewCell.identifier)
//        collectionView.dataSource = self
//        collectionView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
