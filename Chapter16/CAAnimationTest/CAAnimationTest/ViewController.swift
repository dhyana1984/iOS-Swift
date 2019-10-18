//
//  ViewController.swift
//  CAAnimationTest
//
//  Created by Chris Xiong on 2019/10/18.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//
//        //创建动画实例，keyPath为要进行属性动画的属性路径
//        let basicAni = CABasicAnimation(keyPath: "transform.rotation.z")
//        //从0度开始旋转
//        basicAni.fromValue = NSNumber(value: 0)
//        //旋转到180度
//        basicAni.toValue = NSNumber(value:Double.pi)
//        //设置动画时长
//        basicAni.duration = 2
//        //将动画作用于当前界面的视图Layer层之上
//        self.view.layer.add(basicAni, forKey: nil)
//
        //关键帧动画
//        let keyframeAni = CAKeyframeAnimation(keyPath: "transform.rotation.z")
//        //关键帧动画可以设置多个过渡值
//        keyframeAni.values = [NSNumber(value: 0), NSNumber(value: Double.pi/4), NSNumber(value: 0),NSNumber(value:Double.pi)]
//        keyframeAni.duration = 3
//        self.view.layer.add(keyframeAni, forKey: nil)
        
        //阻尼动画，
        let springAni = CASpringAnimation(keyPath: "position.y")
        //模拟重物质量 必需大于0 默认为1会影响惯性
        springAni.mass = 2
        //模拟弹簧劲度系数， 必须大于0 越大回弹越快
        springAni.stiffness = 5
        //设置阻尼系数 必需大于0 这个值越大 回弹幅度越小
        springAni.damping = 2
        springAni.toValue = 300
        springAni.duration = 3
        //创建演示动画的Layer
        let layer = CALayer()
        layer.position = CGPoint(x: 100, y: 100)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer)
        layer.add(springAni, forKey: nil)
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //创建转场动画实例
//        let transAni = CATransition()
//        //设置转场动画类型
//        transAni.type = CATransitionType.push
//        //设置转场动画方向
//        transAni.subtype = CATransitionSubtype.fromTop
//        let layer = CALayer()
//        layer.position = CGPoint(x:300, y :600)
//        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 250)
//        layer.backgroundColor = UIColor.red.cgColor
//        layer.add(transAni, forKey: "")
//        self.view.layer.addSublayer(layer)
        
        
        //创建组合动画效果
        
        //创建背景色过度动画
        let basicAni = CABasicAnimation(keyPath: "backgroundColor")
        basicAni.toValue = UIColor.green.cgColor
        //创建变形动画
        let basicAni2 = CABasicAnimation(keyPath: "transform.scale.x")
        basicAni2.toValue = NSNumber(value: 2)
        //进行动画组合
        let groupAni = CAAnimationGroup()
        groupAni.animations = [basicAni,basicAni2]
        groupAni.duration = 3
        let layer = CALayer()
        layer.position = CGPoint(x:300, y :600)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 250)
        layer.backgroundColor = UIColor.red.cgColor
        layer.add(groupAni, forKey: "")
        self.view.layer.addSublayer(layer)
        
    }

}

