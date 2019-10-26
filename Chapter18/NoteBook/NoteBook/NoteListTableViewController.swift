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
        //模拟创建10条数据
        for _ in 0...10{
            let model = NoteModel()
            model.time = "2016.11.11"
            model.title = "Just Shopping"
            model.body = "Check list........"
            dataArray.append(model)
        }
        //进行导航按钮的加载
        installNavigationItem()
    }
    
    func installNavigationItem(){
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNode))
        let deleteItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteGroup))
        self.navigationItem.rightBarButtonItems = [addItem, deleteItem]
    }
    
    @objc func addNode(){
        
    }
    
    @objc func deleteGroup(){
        
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

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
