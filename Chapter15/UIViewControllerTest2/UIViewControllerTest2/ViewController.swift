//
//  ViewController.swift
//  UIViewControllerTest2
//
//  Created by Chris Xiong on 2019/10/8.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewControllerTwoProtocol {

    

    var label : UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //此label用于显示从后面界面传递过来的数据
        label = UILabel(frame: CGRect(x:20, y:400, width: 300,height: 30))
        self.view.addSubview(label!)
    }


    @IBAction func touch(_ sender: Any) {
        //正向传值，通过属性或者构造器
        //通过属性向ViewControllerTwo传值
        //let viewController = ViewControllerTwo()
        //viewController.data = "This data is passed from the first page by property"
        
        //通过构造方法向ViewControllerTwo传值
        //let viewController = ViewControllerTwo(data: "This data is passed from the first page by constructor")
        
  
        let viewController = ViewControllerTwo(data: "This data is passed from the first page by protocol")
        //设置代理,以便通过代理的回调从后面页面向本页面传值
        //viewController.delegate = self
        
        //对闭包赋值，通过闭包从后面页面向本页面传值
        viewController.closure = {
            (data:String) in self.label?.text = data
        }
        
        //present方法是展现另一个viewController
        self.present(viewController, animated: true, completion: nil)
    }
    func sentData(data: String) {
        self.label?.text = data
    }
}

