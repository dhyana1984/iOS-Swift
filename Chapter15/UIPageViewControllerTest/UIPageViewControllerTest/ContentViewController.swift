//
//  ContentViewController.swift
//  UIPageViewControllerTest
//
//  Created by Chris Xiong on 2019/10/16.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit
import WebKit

class ContentViewController: UIViewController {

    var dataObject: AnyObject?


    @IBOutlet weak var webView: WKWebView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        webView.loadHTMLString(dataObject as! String,
                               baseURL: NSURL(string: "") as URL?)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
