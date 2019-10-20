//
//  ViewController.swift
//  UserDefaultTest
//
//  Created by Chris Xiong on 2019/10/21.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //获取应用程序默认的userDefault.standard
        let userDefaults = UserDefaults.standard
//        //进行url数据的存储
//        userDefaults.set(URL(string: "http://www.sina.cn"), forKey: "urlKey")
//        //进行字符串数据的存储
//        userDefaults.set("stringValue",forKey: "stringLey")
//        //进行Bool值数据的存储
//        userDefaults.set(true,forKey: "boolKey")
//        //进行Double类型的存储
//        userDefaults.set(Double(0.1),forKey:"doubleKey")
//        //进行Float类型数据的存储
//        userDefaults.set(Float(1.5),forKey: "floatKey")
//        //进行Int类型的存储
//        userDefaults.set(5,forKey: "intKey")
//        //进行字典数据的存储
//        userDefaults.set(["1":"一"], forKey: "dicKey")
//        //进行数组数据的存储
//        userDefaults.set([1,2,3,4],forKey: "arrKey")
//        //进行Data数据的存储
//        userDefaults.set(Data(),forKey: "dataKey")
//        //将操作进行同步
//        userDefaults.synchronize()
//        清空一个已经存储过的值
//        userDefaults.removeObject(forKey: "xxx")
        print(userDefaults.url(forKey: "urlKey"))
        
        
    }


}

