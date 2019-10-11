//
//  ViewController.swift
//  UIScrollViewTest
//
//  Created by Chris Xiong on 2019/10/12.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  
    var imageView :UIImageView?
    override func viewDidLoad() {
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let scrollView = UIScrollView(frame: self.view.frame)
        //将滚动视图添加到当前界面
        self.view.addSubview(scrollView)
        //设置代理
        scrollView.delegate = self
        imageView = UIImageView(image: UIImage(named: "timg"))
        imageView?.frame = self.view.frame
        scrollView.addSubview(imageView!)
        scrollView.contentSize = self.view.frame.size
        
        //设置缩放限度
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
//        //创建两个内容视图
//        let subView1 = UIView(frame: self.view.frame)
//        subView1.backgroundColor = UIColor.red
//        let subView2 = UIView(frame: CGRect(x: width, y: 0, width: width, height: height))
//        subView2.backgroundColor = UIColor.blue
//        //将内容视图添加进UIScrollView视图中
//        scrollView.addSubview(subView1)
//        scrollView.addSubview(subView2)
//        //设置UIScrollView实例尺寸
//        scrollView.contentSize = CGSize(width: width * 2, height: height)
    }
    
    //实现UIScrollViewDelegateDe缩放协议方法
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView!
    }


}

