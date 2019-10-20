//
//  ViewController.swift
//  RequestTest
//
//  Created by Chris Xiong on 2019/10/20.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let urlString = "http://api.tianapi.com/wxnew/?key=%@&num=1"
    var apiKey = "6db61ebd2e895b2689b93c30786d5818"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //请求url格式化字符串
        
        //创建请求配置
        let config = URLSessionConfiguration.default
        //创建请求URL
        let url = URL(string: String(format: urlString, apiKey))
        //创建请求实例
        let request = URLRequest(url:url!)
        //创建请求session
        let session = URLSession(configuration: config)
        //创建请求任务
        //dataTask方法创建请求任务实例，闭包在请求结束后会被调用,闭包中的data,response和error是请求返回的内容
        let task = session.dataTask(with: request){
            (data,response,error) in
            let dictionary = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(dictionary ?? "未解析到数据")
            
        }
        //激活请求数据
        task.resume()
        
    }


}

