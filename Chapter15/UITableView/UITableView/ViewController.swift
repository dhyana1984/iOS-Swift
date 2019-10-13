//
//  ViewController.swift
//  UITableView
//
//  Created by Chris Xiong on 2019/10/13.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var curWidth:CGFloat
    var curHeight:CGFloat
    init() {
        super.init(nibName: nil, bundle: nil)
        curWidth = self.view.frame.size.width
        curHeight = self.view.frame.size.height
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //UITableViewDataSource 协议方法，设置列表有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    //UITableViewDataSource 协议方法，设置每行数据的数据载体cell视图
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //根据注册的Cell类Id值获取到载体Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        //进行标题的设置
        cell.textLabel?.text = dataArray?[indexPath.row]
        return cell
    }
    
    //设置列表的分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //设置列表分区头部标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "I'm group head"
    }
    //设置分区尾部标题
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "I'm group footer"
    }
    
    //设置分区头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width:curWidth , height: 120))
        view.backgroundColor = UIColor.red
        return view
    }
    
    //设置分区尾部视图
    func 
    
    
    var dataArray:Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        dataArray = ["1st Row","2nd Row", "3rd Row", "4th Row","5th Row"]
        //.plain是扁平化风格,.grouped是分组风格
        //let tableView = UITableView(frame: self.view.frame, style: .plain)
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        
        //注册cell,进行注册的Cell类需要在对应协议方法中返回
        //第一个参数需传入Class类型的数据，第二个参数为一个字符串类型ID值，通过ID值可以获取到注册的Cell类对应的实例
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
    }


}

