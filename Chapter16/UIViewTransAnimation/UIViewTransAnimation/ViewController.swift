//
//  ViewController.swift
//  UIViewTransAnimation
//
//  Created by Chris Xiong on 2019/10/16.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animationView: UIView?
    var status = true
    let otherView = UIView(frame: CGRect(x: 20, y: 100, width: 280, height: 300))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //创建视图
        animationView = UIView(frame: CGRect(x: 20, y: 100, width: 280, height: 300))
        animationView?.backgroundColor = UIColor.red
        self.view.addSubview(animationView!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //用于重构视图 不切换视图，只是切换展示内容
//        UIView.transition(with: animationView!, duration: 3, options: .transitionCurlUp, animations: {
//            //触发动画以后对视图上的内容进行重构
//            self.animationView!.backgroundColor = UIColor.blue
//        }, completion: nil)
        
        //切换视图
       
      
        otherView.backgroundColor = UIColor.green
        
        if status {
             print("aaa")
            status = false
            UIView.transition(from: animationView!, to: otherView, duration: 3, options: .transitionFlipFromRight, completion: nil)
            
        }else{
             print("bbb")
            UIView.transition(from: otherView , to: animationView!, duration: 3, options: .transitionFlipFromRight, completion: nil)
            status = true
        }


    }
    
}

