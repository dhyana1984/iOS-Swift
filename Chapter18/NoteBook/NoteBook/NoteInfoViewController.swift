//
//  NoteInfoViewController.swift
//  NoteBook
//
//  Created by Chris Xiong on 2019/10/27.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class NoteInfoViewController: UIViewController {
    //当前编辑的记事数据模型
    var noteModel:NoteModel?
    //标题文本框
    var titleTextField: UITextField?
    //记事内容文本视图
    var bodyTextView: UITextView?
    //记事所属分组
    var group: String?
    var isNew = false

    override func viewDidLoad() {
        super.viewDidLoad()
        //消除导航对布局的影响
        self.edgesForExtendedLayout = UIRectEdge()
        self.view.backgroundColor = UIColor(hex: "#ebebeb")
        self.title = "Note"
        //监听键盘事件
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        //进行界面的加载
        installUI()
        //进行导航功能按钮的加载
        installNavigationItem()
    }
    
    func installNavigationItem(){
        //创建两个导航功能按钮，用于保存与删除记事
        let itemSave = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addNote))
        let itemDelete = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteNote))
        self.navigationItem.rightBarButtonItems = [itemSave,itemDelete]
    }
    
    //添加记事
     @objc func addNote(){
        //如果是新记事，进行数据的新增
        if isNew{
            if titleTextField?.text! != nil && titleTextField!.text!.count > 0{
                noteModel = NoteModel()
                noteModel?.title = titleTextField?.text!
                noteModel?.body = bodyTextView?.text
                //将当前时间进行格式化
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                noteModel?.time = dateFormatter.string(from: Date())
                noteModel?.group = group
                DataManager.addNote(note: noteModel!)
                self.navigationController!.popViewController(animated: true)
                
            }
        }else{
            //进行更新记事逻辑处理
            if titleTextField?.text != nil && titleTextField!.text!.count > 0{
                noteModel?.title = titleTextField?.text!
                noteModel?.body = bodyTextView?.text
                //将当前时间进行格式化
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                noteModel?.time = dateFormatter.string(from: Date())
                noteModel?.group = group
                DataManager.updateNote(note: noteModel!)
                self.navigationController!.popViewController(animated: true)
            }
        }
    }
    
    //删除记事
    @objc func deleteNote(){
        let alertController = UIAlertController(title:"Warning",message: "Are you sure to delete this note?", preferredStyle: .alert)
        let action = UIAlertAction(title:"Cancel",style: .cancel,handler: nil)
        let action2 = UIAlertAction(title:"Delete", style: .destructive, handler:{
            (UIAlertAction) -> Void in
            //如果不是新建记事，进行删除操作
            if !self.isNew{
                DataManager.deleteNote(note: self.noteModel!)
                self.navigationController!.popViewController(animated: true)
            }
        })
        alertController.addAction(action)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //当键盘出现时
    @objc func keyBoardShow(notification:Notification){
        let userInfo = notification.userInfo!
        let frameInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject
        //获取键盘高度
        let height = frameInfo.cgRectValue.size.height
        //进行布局更新
        bodyTextView?.snp.updateConstraints({
            (maker) in
            maker.bottom.equalTo(-30-height)
        })
        UIView.animate(withDuration: 0.3, animations: {
            ()  in
            self.view.layoutIfNeeded()
        })
    }
    
    //当键盘消失时调用方法
    @objc func keyBoardHidden(notification:Notification){
        bodyTextView?.snp.updateConstraints({
            (maker) in
            maker.bottom.equalTo(-30)
        })
        UIView.animate(withDuration: 0.3, animations: {
            () in
            self.view.layoutIfNeeded()
        })
        
    }
    
    //当用户点击屏幕非文本区域时，进行收键盘操作
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        bodyTextView?.resignFirstResponder()
        titleTextField?.resignFirstResponder()
    }
    //在析构方法中移除通知的监听
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //进行界面加载
    func installUI(){
        titleTextField = UITextField()
        self.view.addSubview(titleTextField!)
        titleTextField?.borderStyle = .none
        titleTextField?.textColor = UIColor.darkGray
        titleTextField?.placeholder = "Please input title"
        titleTextField?.snp.makeConstraints({
            (maker) in
            maker.top.equalTo(30)
            maker.left.equalTo(30)
            maker.right.equalTo(-30)
            maker.height.equalTo(30)
        })
        
        let line = UIView()
        self.view.addSubview(line)
        line.backgroundColor = UIColor.gray
        line.snp.makeConstraints{
            (maker) in
            maker.top.equalTo(titleTextField!.snp.bottom).offset(5)
            maker.left.equalTo(15)
            maker.right.equalTo(-15)
            maker.height.equalTo(0.5)
        }
        bodyTextView = UITextView()
        bodyTextView?.layer.borderWidth = 0.5
        bodyTextView?.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(bodyTextView!)
        bodyTextView?.snp.makeConstraints({
            (maker) in
            maker.left.equalTo(30)
            maker.right.equalTo(-30)
            maker.top.equalTo(line.snp.bottom).offset(10)
            maker.bottom.equalTo(-30)
        })
        if !isNew{
            titleTextField?.text = noteModel?.title
            bodyTextView?.text = noteModel?.body
        }
    }

}
