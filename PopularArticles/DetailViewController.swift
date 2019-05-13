//
//  DetailViewController.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/11/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    

    func configureView() {
        title = ""
        if let detail = detailItem {
            if let url = detail.url {
                let request = URLRequest(url: url)
                if let webView = webView {
                    webView.load(request)
                }
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    var detailItem: Article? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

