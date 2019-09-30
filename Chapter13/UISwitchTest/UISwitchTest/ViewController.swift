//
//  ViewController.swift
//  UISwitchTest
//
//  Created by Chris Xiong on 2019/9/30.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let swi  = UISwitch()
        //控件位置
        swi.center = CGPoint(x:100, y:100)
        //设置开启状态的颜色
        swi.onTintColor = UIColor.green
        //设置普通状态的颜色
        swi.tintColor = UIColor.red
        //设置开关滑块的颜色
        swi.thumbTintColor = UIColor.purple
        //设置开关初始状态
        swi.isOn = true
        //添加用户交互事件
        swi.addTarget(self, action: #selector(change), for: UIControl.Event.valueChanged)
        self.view.addSubview(swi)
        
        
        
    }
    @objc func change(swi:UISwitch){
        //可以从传递进来的UISwitch控件中获取开关状态
        print("开关状态是\(swi.isOn)")
    }


}

