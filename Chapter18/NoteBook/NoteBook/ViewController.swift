//
//  ViewController.swift
//  NoteBook
//
//  Created by Chris Xiong on 2019/10/23.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController , HomeButtonDelegate{
    
    var homeView : HomeView?
    //存放用户纪事分组信息
    var dataArray: Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Anything About Life"
        //取消导航栏对页面布局的影响
        self.edgesForExtendedLayout = UIRectEdge()
        //dataArray = DataManager.getGroupData()
        self.installUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         dataArray = DataManager.getGroupData()
        self.homeView?.dataArray = dataArray
        self.homeView?.updateLayout()
    }
    
    func installUI(){
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        //对homeView属性进行实例化
        homeView = HomeView(frame: CGRect(x: 0, y: 0, width: width, height: height - 64))
        self.view.addSubview(homeView!)
        homeView?.dataArray = dataArray
        homeView!.homeButtonDelegate = self
        installNavigationItem()
    }
    
    func installNavigationItem(){
        //创建导航功能按钮，将其风格设置为添加风格
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGroup))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func addGroup(){
        //创建UIAlertController实例， 风格设置为alert风格
        let alertController = UIAlertController(title: "Add Group", message: "The group you added cannot be duplicated", preferredStyle: .alert)
        //向警告框中添加一个文本输入框
        alertController.addTextField{
            (textField) in
            textField.placeholder = "Please input group name"
        }
        //向警告框中添加一个取消按钮
        let alertItem = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {
            (UIAlertAction) in
                return
        })
        //向警告框中添加一个确定按钮
        let alertItemAdd = UIAlertAction(title: "Sure", style: .default, handler:
        {
            (UIAlertAction) -> Void in
                //进行有效性判断
            var exist = false
            self.dataArray?.forEach({(element) in
                //如果此分组已经存在，或者用户输入为空
                if element == alertController.textFields?.first?.text || alertController.textFields?.first!.text?.count == 0{
                    exist = true
                }
            })
            if exist{
                return
            }
            //将用户添加的分组名称追加进dataArray中
            self.dataArray?.append(alertController.textFields!.first!.text!)
            //进行homeView刷新
            self.homeView?.dataArray = self.dataArray
            self.homeView?.updateLayout()
            //将添加的分组写入数据库
            DataManager.saveGroup(name: alertController.textFields!.first!.text!)
        })
        alertController.addAction(alertItem)
        alertController.addAction(alertItemAdd)
        //展示警告
        self.present(alertController, animated: true, completion: nil)
    }
    
    func homeButtonClick(title: String) {
        let controller = NoteListTableViewController()
        controller.name = title
        print(title)
        self.navigationController?.pushViewController(controller, animated: true)
    }


}

