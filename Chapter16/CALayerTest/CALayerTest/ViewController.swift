//
//  ViewController.swift
//  CALayerTest
//
//  Created by Chris Xiong on 2019/10/18.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //CAGradientLayer颜色渐变图层
        //创建图像层
        let gradientLayer = CAGradientLayer()
        //设置图层尺寸与位置
        gradientLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        gradientLayer.position = CGPoint(x: 100, y: 100)
        //设置要进行色彩渐变的颜色
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
        //设置要进行简便的临界位置
        gradientLayer.locations = [NSNumber(value:0.2),NSNumber(value:0.5), NSNumber(value:0.7)]
        //设置渐变的起始点与结束点
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x:0.5, y:1)
        //添加到当前视图上
        self.view.layer.addSublayer(gradientLayer)
        
        //复制视图容器
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.position = CGPoint.zero
        //创建内容图层
        let subLayer = CALayer()
        subLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        subLayer.position = CGPoint(x: 100, y: 250)
        subLayer.backgroundColor = UIColor.red.cgColor
        replicatorLayer.addSublayer(subLayer)
        //设置每次复制将副本延x轴平移30个单位
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(30, 0, 0)
        //设置副本复制个数
        replicatorLayer.instanceCount = 10
        self.view.layer.addSublayer(replicatorLayer)
        
        //自定义形状图层
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint.zero
        //创建图形路径
        let path = CGMutablePath()
        //设置路径起点
        path.move(to: CGPoint(x: 200, y: 300))
        //进行画线
        path.addLine(to: CGPoint(x:400,y:300))
        path.addLine(to: CGPoint(x:300,y:400))
        path.addLine(to: CGPoint(x:200,y:300))
        //设置图层路径
        shapeLayer.path = path
        //设置图形边缘线条起点
        shapeLayer.strokeStart = 0
        //设置图形边缘线条终点
        shapeLayer.strokeEnd = 1
        //设置填充规则
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        //设置填充色
        shapeLayer.fillColor = UIColor.red.cgColor
        //设置边缘线条颜色
        shapeLayer.strokeColor = UIColor.blue.cgColor
        //设置边缘线条宽度
        shapeLayer.lineWidth = 1
        self.view.layer.addSublayer(shapeLayer)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }


}

