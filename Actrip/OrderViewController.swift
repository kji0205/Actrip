//
//  OrderViewController.swift
//  Actrip
//
//  Created by Jimmy on 2020/07/25.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import UIKit
import WebKit

class OrderViewController: ATControllerBase, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        guard let url = URL(string:"https://actrip.co.kr/ordersearch") else {return}
//
//        let request = URLRequest(url: url)
//
//        webView?.load(request)
        
        spinner.hidesWhenStopped = true
        
        var url: URL?
        url = URL(string: "https://actrip.co.kr/ordersearch")
        let request = URLRequest(url: url!)

        webView?.navigationDelegate = self // set the delegate

        webView?.load(request)
    }
    
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webView.isHidden = true
        spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        print("Finished navigating to url \(String(describing: webView.url))");

        let script="(function(){ var footer=document.getElementById('headerWrap'); footer.remove(); }())"

        webView.evaluateJavaScript(script) { (result, error) in
            if error != nil {
                print(result ?? "")
            }
            webView.isHidden = false
            self.spinner.stopAnimating()
        }
    }

    /*
    // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a littl preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
