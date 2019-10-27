//
//  NoteListTableViewController.swift
//  NoteBook
//
//  Created by Chris Xiong on 2019/10/27.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {
    //数据源数组
    var dataArray = Array<NoteModel>()
    //当前分组
    var name:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏标题
        self.title = name
        //进行导航按钮的加载
        installNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //从数据库读取记事
        dataArray = DataManager.getNote(group: name!)
        self.tableView.reloadData()
    }
    
    func installNavigationItem(){
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNode))
        let deleteItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteGroup))
        self.navigationItem.rightBarButtonItems = [addItem, deleteItem]
    }
    
    @objc func addNode(){
        let infoViewController = NoteInfoViewController()
        infoViewController.group = name!
        infoViewController.isNew = true
        self.navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    @objc func deleteGroup(){
        let alertController = UIAlertController(title:"Warning",message: "Are you sure to delete all the notes in this Group?", preferredStyle: .alert)
        let action = UIAlertAction(title:"Cancel",style: .cancel,handler: nil)
        let action2 = UIAlertAction(title:"Delete", style: .destructive, handler:{
            (UIAlertAction) -> Void in
                DataManager.deleteGroup(name: self.name!)
                self.navigationController!.popViewController(animated: true)
            
        })
        alertController.addAction(action)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
    }

    //设置分区数为1
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //设置行数为数据源中的数据个数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //进行数据载体CellDe设置
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "noteListCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil{
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellID)
        }
        let model = dataArray[indexPath.row]
        cell?.textLabel?.text = model.title
        cell?.detailTextLabel?.text = model.time
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    //点击某条记事，跳转记事详情页面
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //取消当前Cell的选中状态
        tableView.deselectRow(at: indexPath, animated: true)
        let infoViewController = NoteInfoViewController()
        infoViewController.group = name!
        infoViewController.isNew = false
        infoViewController.noteModel = dataArray[indexPath.row]
        self.navigationController?.pushViewController(infoViewController, animated: true)
        
    }

}
