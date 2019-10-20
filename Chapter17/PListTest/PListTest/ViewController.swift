//
//  ViewController.swift
//  PListTest
//
//  Created by Chris Xiong on 2019/10/21.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //读取w手工建立的plist的内容，只能读取，不能修改
//        //获取文件路径
//        let path = Bundle.main.path(forResource: "NewPlist", ofType: "plist")
//        //将文件内容读成字典
//        let dic = NSDictionary(contentsOfFile: path!)
//        //数据输出
//        print(dic ?? "dic为空")
        
        //从代码创建plist，并且自己定义数据
        //获取沙盒的用户数据目录
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        //拼接上文件名
        let fileName = path! + "/MyPlist.plist"
        let dic:NSDictionary = ["name":"chris","age":"35"]
        //写进文件
        dic.write(toFile: fileName, atomically: true)
        //将存储的Plist文件数据进行读取
        let dicRes = NSDictionary(contentsOfFile: fileName)
        print(dicRes ?? "dicRes为nil")
    }


}

