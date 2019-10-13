//
//  ViewController.swift
//  UITableViewIndexText
//
//  Created by Chris Xiong on 2019/10/14.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{


    var dataArray = Array<String>()
    var titleArray:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...3{
            dataArray.append("联系人\(i)")
        }

        titleArray = ["#","A","B","C","D","E","F","G","H","更多"]

        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        
        //注册cell,进行注册的Cell类需要在对应协议方法中返回
    //第一个参数需传入Class类型的数据，第二个参数为一个字符串类型ID值，通过ID值可以获取到注册的Cell类对应的实例
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    //设置列表分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    //设置索引栏标题
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleArray!
    }
    //设置分区头部标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray![section]
    }
    //将索引栏上的文字与具体分区进行绑定
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    //设置列表数据条数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //根据注册的Cell类Id值获取到载体Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        //进行标题的设置
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    


}

