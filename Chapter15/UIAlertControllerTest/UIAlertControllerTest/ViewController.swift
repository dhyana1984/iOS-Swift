//
//  ViewController.swift
//  UIAlertControllerTest
//
//  Created by Chris Xiong on 2019/10/10.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


        @IBAction func popAlert(_ sender: UIButton) {
     
        let alertController = UIAlertController(title: "我是警告弹窗", message: "这里填写内容", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "确定", style: .default, handler: nil)
        let alertAction2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        self .present(alertController, animated: true, completion: nil)
               }
    }
    


