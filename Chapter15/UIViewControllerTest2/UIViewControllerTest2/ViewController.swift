//
//  ViewController.swift
//  UIViewControllerTest2
//
//  Created by Chris Xiong on 2019/10/8.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touch(_ sender: Any) {
        self.present(ViewControllerTwo(), animated: true, completion: nil)
    }
}

