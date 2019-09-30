//
//  ViewController.swift
//  UIActivityIndicatorViewTest
//
//  Created by Chris Xiong on 2019/9/30.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let activity = UIActivityIndicatorView(
            style: UIActivityIndicatorView.Style.large
        )
        activity.center = self.view.center
        activity.startAnimating()
        self.view.addSubview(activity)
    }


}

