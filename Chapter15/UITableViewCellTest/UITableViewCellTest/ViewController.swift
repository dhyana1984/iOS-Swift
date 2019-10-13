//
//  ViewController.swift
//  UITableViewCellTest
//
//  Created by Chris Xiong on 2019/10/14.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    var curWidth:CGFloat = 0.0
    var curHeight:CGFloat = 0.0
    var dataArray:Array<Product>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建测试产品
        let pro1 = Product()
        pro1.imageName = "wine"
        pro1.name = "杜康酒1500ml灌装"
        pro1.subTitle = "  何以解忧，唯有杜康，纯粮食酿造，国庆大酬宾"
        pro1.price = "59元"
        let pro2 = Product()
        pro2.imageName = "wine"
        pro2.name = "杜康酒1500ml灌装"
        pro2.subTitle = "  何以解忧，唯有杜康，纯粮食酿造，国庆大酬宾"
        pro2.price = "59元"
        //对数据源进行初始化
        dataArray = [pro1,pro2]
        
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
              
        //注册cell,进行注册的Cell类需要在对应协议方法中返回
        //因为自定义的Cell是通过XIB文件创建，所以在注册Cell时不再是注册一个类，而是注册一个UINib类的对象，UINib对象用来描述XIB的某个文件
        tableView.register(UINib.init(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        
        //打开tableView编辑模式
        tableView.isEditing = true
        
        
        self.view.addSubview(tableView)

        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //根据注册的Cell类Id值获取到载体Cell
        let cell:ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! ProductTableViewCell
        let model = dataArray![indexPath.row]
        //使用数据模型中的信息对cell进行设置
        cell.iconView.image = UIImage(named: model.imageName!)
        cell.proTitle.text = model.name
        cell.proDetail.text = model.subTitle
        cell.price.text = model.price
        cell.proDetail.numberOfLines = 0
        return cell
    }
    
    //设置每一行高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //返回每行cell的编辑模式
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == 0{
            return .insert
        }else{
            return .delete
        }
    }
    
    //设置显示的交互按钮文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        if indexPath.row == 0{
            return "插入"
        }else{
            return "删除"
        }
        
    }
    
    //点击交互按钮后回调方法
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //根据编辑模式做不同的逻辑处理
        if editingStyle == UITableViewCell.EditingStyle.delete{
            print("点击了删除按钮")
            //先删除数据源中此条数据
            dataArray?.remove(at: indexPath.row)
            //再从界面上删除此条cell
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }else{
            print("点击了插入按钮")
            
            //先向数据源中插入一条数据
            let pro1 = Product()
            pro1.imageName = "wine"
            pro1.name = "1杜康酒1500ml灌装"
            pro1.subTitle = "  1何以解忧，唯有杜康，纯粮食酿造，国庆大酬宾"
            pro1.price = "60元"
            dataArray?.insert(pro1, at: indexPath.row)
            
            //再向界面中插入一条cell
            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
        }
    }
    
    //实现对数据的排序操作
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //修改数据源
        let temp = dataArray![sourceIndexPath.row]
        let temp2 = dataArray![destinationIndexPath.row]
        dataArray![sourceIndexPath.row] = temp2
        dataArray![destinationIndexPath.row] = temp
    }


}

