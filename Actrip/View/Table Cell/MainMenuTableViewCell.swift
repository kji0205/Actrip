//
//  MainMenuTableViewCell.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/19.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell {

    let mainMenu = [
        "isurf", "ibus", "ibbq", "ievent", "ibed", "ifood"
    ]

    static let identifier = "MainMenuTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MainMenuTableViewCell", bundle: nil)
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(MainMenuCollectionViewCell.nib(), forCellWithReuseIdentifier: MainMenuCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension MainMenuTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMenuCollectionViewCell.identifier, for: indexPath) as! MainMenuCollectionViewCell
        cell.configure(imageSrc: mainMenu[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        print(collectionView.bounds.width)
        
        var numberOfRow = 3.8
        
        // 가로 모드
        if (UIDevice.current.orientation.isLandscape) {
            numberOfRow = 5.5
        } else {
            numberOfRow = 3.8
        }

        return CGSize(width: collectionView.bounds.width/CGFloat(numberOfRow), height: collectionView.bounds.height/2.7)
        
    }
    
    // 테이블뷰셀의 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
