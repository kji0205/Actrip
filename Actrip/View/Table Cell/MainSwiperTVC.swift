//
//  MainSwiperTVC.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/28.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class MainSwiperTVC: UITableViewCell {

    static let identifier = "MainSwiperTVC"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainSwiperTVC", bundle: nil)
    }
    
    private var _mainSwiperData: [MainScreenDataBanner]?
    
    public var mainSwiperData: [MainScreenDataBanner]? {
        get {
            return _mainSwiperData
        }
        set {
            _mainSwiperData = newValue
            mainSwiperCV.reloadData()
        }
    }
    
    @IBOutlet weak var mainSwiperCV: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainSwiperCV.register(MainSwiperCellCVC.nib(), forCellWithReuseIdentifier: MainSwiperCellCVC.identifier)
        mainSwiperCV.dataSource = self
        mainSwiperCV.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MainSwiperTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainSwiperData?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainSwiperCellCVC.identifier, for: indexPath) as! MainSwiperCellCVC
        if mainSwiperData != nil, let banner = mainSwiperData?[indexPath.row] {
            cell.configure(data: banner)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    // 테이블뷰셀의 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
