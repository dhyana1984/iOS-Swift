//
//  ViewController.swift
//  UIButtonTest
//
//  Created by Chris Xiong on 2019/9/30.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //如果设置按钮图片，需要用 UIButton.ButtonType.custom
        let buttonOne = UIButton(type: UIButton.ButtonType.custom)
        //设置按钮位置与尺寸
        buttonOne.frame = CGRect(x:20,y:40,width:200,height: 200)
        //设置按钮背景色
        buttonOne.backgroundColor = UIColor.purple
        //设置按钮标题, 第二个参数是为显示此标题时所对应的按钮状态
        buttonOne.setTitle("title", for: UIControl.State())
        //设置标题文字颜色
        buttonOne.setTitleColor(UIColor.white, for: UIControl.State())
        //UIControl.Event.touchUpInside是在区域内按下抬起
        buttonOne.addTarget(self, action: #selector(touchBegin), for: UIControl.Event.touchUpInside)
        //设置UIButton控件内容图片,会覆盖文字
        buttonOne.setImage(UIImage(named: "pic1"), for: UIControl.State())
        //设置UIButton背景图片，文字浮在背景之上
        //buttonOne.setBackgroundImage(UIImage(named: "pic1"), for: UIControl.State())
        //设置标题文字位置偏移
        buttonOne.titleEdgeInsets = UIEdgeInsets(top:50,left:0,bottom: 0,right: 20)
        //设置内容图片的位置偏移
        buttonOne.imageEdgeInsets = UIEdgeInsets(top:0,left:30,bottom: 30,right: 0)
        self.view.addSubview(buttonOne)
        
        
    }
    @objc func touchBegin(){
        print("user pressed the button!")
    }
    



}


