//
//  ViewController.swift
//  UILableTest
//
//  Created by Chris Xiong on 2019/9/29.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //创建UILabel控件对象
        let label = UILabel(frame: CGRect(x:50,y:50,width:200,height:30))
        label.text = "I'm a simple label control"
        self.view.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x:50,y:90,width: 200,height: 30))
        label2.text = "I'm a customized label control"
        //设置字体
        label2.font = UIFont.boldSystemFont(ofSize: 20)
        //设置字体颜色
        label2.textColor = UIColor.red
        //设置阴影颜色
        label2.shadowColor = UIColor.green
        //设置阴影偏移
        label2.shadowOffset = CGSize(width:2,height: 2)
        //设置文字对其模式
        label2.textAlignment = NSTextAlignment.center
        //添加到视图
        self.view.addSubview(label2)
        
        
        let label3 = UILabel(frame: CGRect(x:50,y:120,width: 200,height: 150))
        label3.text = "long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text "
        //设定显示行数
        label3.numberOfLines = 7
         self.view.addSubview(label3)
        
        let label4 = UILabel(frame: CGRect(x:50,y:290,width: 200,height: 150))
        //设置个性化文本
        let attri = NSMutableAttributedString(string:"I'm customized text")
        attri.addAttributes(
            [
                NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize:20),//字体
                NSAttributedString.Key.foregroundColor:UIColor.blue,        //颜色
                NSAttributedString.Key.backgroundColor:UIColor.yellow       //背景颜色
            ],
            range: NSRange(location:3,length: 3)
        )
        label4.attributedText = attri
        self.view.addSubview(label4)
        
        
        
    }


}

