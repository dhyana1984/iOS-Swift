//
//  ViewController.swift
//  UISliderTest
//
//  Created by Chris Xiong on 2019/9/30.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let slider = UISlider(frame:CGRect(x:20,y:200,width: 300,height: 30))
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.value = 5
        //设置滑块左侧进度条颜色
        slider.minimumTrackTintColor = UIColor.red
        //设置滑块右侧进度条颜色
        slider.maximumTrackTintColor = UIColor.green
        //设置滑块颜色
        slider.thumbTintColor = UIColor.blue
        slider.addTarget(self, action: #selector(change), for: UIControl.Event.valueChanged)
        //只在拖拽动作结束后出发用户交互事件
        slider.isContinuous = false
        self.view.addSubview(slider)
    }

    @objc func change(slider:UISlider){
        print(slider.value)
    }

}

