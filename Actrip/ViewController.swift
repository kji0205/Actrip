//
//  ViewController.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/10.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet private var table: UITableView!
    
    // 1
    fileprivate var mainSwiper: [MainScreenDataBanner]?
    
    // 2
    fileprivate var mainTipData: MainTip? {
        didSet {
            //            self.mainTipTitle.text = mainTipData?.titlename
            //            self.mainTipCollectionView.reloadData()
//            MainMenuTableViewCell.configue
        }
    }
    
    // main_banner
    fileprivate var mainBanner: MainScreenDataBanner?
    
    // main_plan
    fileprivate var mainPlan: MainPlan?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        table.register(MainMenuTableViewCell.nib(), forCellReuseIdentifier: MainMenuTableViewCell.identifier)
//        table.register(MainTipTableViewCell.nib(), forCellReuseIdentifier: MainTipTableViewCell.identifier)
        
        table.register(cellTypes: [MainSwiperTVC.self, MainMenuTableViewCell.self, MainTipTableViewCell.self, MainBannerTVC.self, MainPlanTVC.self])
        
        table.dataSource = self
        table.delegate = self
        
        fetchMainScreenData()
        
        self.table.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func fetchMainScreenData() {
        
        // 1
        let urlString = "http://actrip.co.kr/act/callback/appdata.php"
        guard let url = URL(string: urlString) else { return }
        
        // 2
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }

            guard let data = data else { return }
            do {
                // 3
                //Decode data
                let JSONData = try JSONDecoder().decode(MainScreenDataModel.self, from: data)

                // 4
                //Get back to the main queue
                DispatchQueue.main.async {
                    self.mainSwiper = JSONData.mainSwiper
                    self.mainTipData = JSONData.mainTip
                    self.mainBanner = JSONData.mainBanner
                    self.mainPlan = JSONData.mainPlan
                    self.table.reloadData()
                }

            } catch let jsonError {
                print(jsonError)
            }
        // 5
        }.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 메인메뉴 영역
        if indexPath.row == 0 {
            var cell = MainMenuTableViewCell()
            cell = table.dequeueReusableCell(withIdentifier: MainMenuTableViewCell.identifier, for: indexPath) as! MainMenuTableViewCell

            return cell
        }
        else if indexPath.row == 1
        {
            var cell = MainSwiperTVC()
            cell = table.dequeueReusableCell(withIdentifier: MainSwiperTVC.identifier, for: indexPath) as! MainSwiperTVC
            
            cell.mainSwiperData = self.mainSwiper
            
            return cell
        }
        else if indexPath.row == 2
        {
            var cell = MainTipTableViewCell()
            cell = table.dequeueReusableCell(withIdentifier: MainTipTableViewCell.identifier, for: indexPath) as! MainTipTableViewCell
            
            cell.mainTipData = self.mainTipData
            return cell
        }
        else if indexPath.row == 3
        {
            var cell = MainBannerTVC()
            cell = table.dequeueReusableCell(withIdentifier: MainBannerTVC.identifier, for: indexPath) as! MainBannerTVC
            
            cell.mainScreenDataBanner = self.mainBanner
            return cell
        }
        else if indexPath.row == 4
        {
            var cell = MainPlanTVC()
            cell = table.dequeueReusableCell(withIdentifier: MainPlanTVC.identifier, for: indexPath) as! MainPlanTVC
            
            cell.mainPlan = self.mainPlan
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var tableViewCellHeight = CGFloat()
        
        // 메인메뉴 영역
        if indexPath.row == 0 {
            tableViewCellHeight = 200
        } else if indexPath.row == 1 {
            tableViewCellHeight = 120
        } else if indexPath.row == 2 {
            tableViewCellHeight = 300
        } else if indexPath.row == 3 {
            tableViewCellHeight = 120
        } else if indexPath.row == 4 {
            tableViewCellHeight = 250
        }
        
        return tableViewCellHeight
    }
}
