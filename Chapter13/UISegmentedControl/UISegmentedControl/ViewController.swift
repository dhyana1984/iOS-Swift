//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Chris Xiong on 2019/9/30.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let segmentedControl = UISegmentedControl(items: ["Yes","No"])
        segmentedControl.frame = CGRect(x:20,y:200,width: 300,height: 50)
        //segmentedControl.selectedSegmentTintColor = UIColor.blue
        segmentedControl.layer.borderWidth = 1.5
        

        //添加用户交互
        segmentedControl.addTarget(self, action: #selector(sele), for: UIControl.Event.valueChanged)
        //向segmentedControl中插入新的文字item
        
        
        
        
        self.view.addSubview(segmentedControl)
    }
    @objc func sele(seg:UISegmentedControl){
        print("选择了\(seg.selectedSegmentIndex)")
        //seg.insertSegment(withTitle: "Button5", at: 0, animated: true)
    }


}

