//
//  ViewController.swift
//  UISteperTest
//
//  Created by Chris Xiong on 2019/10/1.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let stepper = UIStepper(frame: CGRect(x:100, y:200,width: 0, height: 0))
        //控件颜色
        stepper.tintColor = UIColor.red
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        //设置控件步长
        stepper.stepValue = 1
        self.view.addSubview(stepper)
        
    }


}

