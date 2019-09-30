//
//  ViewController.swift
//  UIPageControl
//
//  Created by Chris Xiong on 2019/9/30.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pageControl = UIPageControl(frame: CGRect(x:100, y:100,width: 280,height: 30))
        //设置页数
        pageControl.numberOfPages = 10
        //背景色
        pageControl.backgroundColor = UIColor.red
        //设置页码点背景色
        pageControl.pageIndicatorTintColor = UIColor.green
        //设置当前选中页码点的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        //设置当前选中的页码数
        pageControl.currentPage = 3
        //添加用户交互事件
        pageControl.addTarget(self, action: #selector(change), for: UIControl.Event.valueChanged)
        self.view.addSubview(pageControl)
    }
    @objc func change(pageControl:UIPageControl){
        print("当前所在页码\(pageControl.currentPage)")
    }

}

