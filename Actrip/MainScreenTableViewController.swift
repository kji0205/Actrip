//
//  MainScreenTableViewController.swift
//  Actrip
//
//  Created by Jimmy on 2020/06/12.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit
import SafariServices

class MainScreenTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainMenuCell", for: indexPath)
        cell.backgroundColor = UIColor.yellow
        

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuCV.dataSource = self
        mainMenuCV.delegate = self
        fetchMainScreenData()
    }
    
    private var mainMenu = [
        "isurf", "ibus", "ibbq", "ievent", "ibed", "ifood"
    ]
    @IBOutlet weak var mainMenuCV: UICollectionView!
    
    /**
     main_swiper / main_tip / main_hashtag / main_banner / main_plan
     
     let mainSwiper: [MainScreenDataBanner]
     let mainTip: MainTip?
     let mainHashtag: [MainScreenDataHashTag]
     let mainBanner: MainScreenDataBanner?
     let mainPlan: MainPlan?
     */
    
    fileprivate var mainTipData: MainTip? {
        didSet {
            //            self.mainTipTitle.text = mainTipData?.titlename
            //            self.mainTipCollectionView.reloadData()
        }
    }
    
    private var mainScreen: MainScreenDataModel? {
        didSet {
            print(mainScreen?.mainBanner?.imgurl ?? "no")

            DispatchQueue.main.async {
            // 스크롤 배너
            self.setMainBannerSwiperImage(mainScreenDataBanner: self.mainScreen?.mainSwiper)
                            // 팁
            //                self.makeMainTipView(mainTip: mainScreenData.mainTip)
            //                // 해시태그
            //                self.setHashTagView(hashTag: mainScreenData.mainHashtag)
            //                // 스크롤 배너 2
            //                self.setMainBannerImage(mainScreenDataBanner: mainScreenData.mainBanner)
            //                // 기획전
            //                self.setPlanshop(planshopData: mainScreenData.mainPlan)
            }
//            DispatchQueue.main.async {
//
//            }
        }
    }
    
    
    
    @IBOutlet weak var swiperBanner: UIScrollView!
    
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
                    print(JSONData)
                }

            } catch let jsonError {
                print(jsonError)
            }
        // 5
        }.resume()
    }

    func setMainBannerSwiperImage(mainScreenDataBanner data: [MainScreenDataBanner]?) {
        
        guard let d = data else { return }
        
        for i in 0..<d.count {
            
            let imageView = UIImageView()

            imageView.downloaded(from: d[i].imgurl, contentMode: .scaleAspectFill)
            imageView.onClick {
                guard let url = URL(string: d[i].link) else { return }
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true, completion: nil)
            }

            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.swiperBanner.frame.width, height: self.swiperBanner.frame.height)

            swiperBanner.contentSize.width = swiperBanner.frame.width * CGFloat(i + 1)
            swiperBanner.addSubview(imageView)
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
