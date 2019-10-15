//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by Chris Xiong on 2019/10/16.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animationView : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animationView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        animationView?.backgroundColor = UIColor.red
        self.view.addSubview(animationView!)
    }
    //背景颜色变化动画
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        UIView.animate(withDuration: 1){
//            self.animationView?.backgroundColor = UIColor.blue
//        }
    
//      移动动画
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        UIView.animate(withDuration: 1, animations: {
//            self.animationView?.backgroundColor = UIColor.blue
//        }){
//            (finish) in
//            //这个闭包会在上一层动画执行完以后调用
//            UIView.animate(withDuration: 2, animations: {
//                //在2s内animationView的中心点移动
//                self.animationView?.center = CGPoint(x:150, y:300)
//            })
//        }
//    }
    
    //循环执行动画
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        UIView.animate(withDuration: 1, delay: 2, options: [UIView.AnimationOptions.repeat], animations: {
//            self.animationView?.backgroundColor = UIColor.blue
//        }, completion: nil)
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.7, options: [], animations: {
            self.animationView?.center = CGPoint(x:150,y:350)
        }, completion: nil)
    }
    
    
}




