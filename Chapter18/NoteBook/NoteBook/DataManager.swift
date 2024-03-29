//
//  DataManager.swift
//  NoteBook
//
//  Created by Chris Xiong on 2019/10/26.
//  Copyright © 2019 org.chris. All rights reserved.
//

import SQLiteSwift3

class DataManager: NSObject {
    //创建一个数据库操作对象属性
    static var sqlHandle: SQLiteSwift3?
    //标记是否已经打开数据库
    static var isOpen = false
    //提供一个对分组数据进行存储类方法
    class func saveGroup(name:String){
        //判断数据库是否打开，如果没有打开，则打开数据库操作
        if !isOpen{
            self.openDataBase()
        }
        //创建一个数据表字段对象
        let key = SQLiteKeyObject()
        //设置字段名
        key.name = "groupName"
        //设置字段名为字符串
        key.fieldType = TEXT
        //将字段修饰为唯一
        key.modificationType = UNIQUE
        //进行分组表的创建，如果已经存在，则不执行任何操作
        if !(sqlHandle!.searchAllTableName()?.contains("groupTable"))!{
            sqlHandle!.createTable(withName:"groupTable", keys: [key])
        }
        //进行数据的插入
        sqlHandle!.insertData(["groupName":name], intoTable: "groupTable")
    }
    
    //提供一个获取所有分组数据的类方法
    class func getGroupData () -> [String]{
        if !isOpen{
            self.openDataBase()
        }
        //创建查询请求对象
        let request = SQLiteSearchRequest()
        //查询结果容器数组
        var array = Array<String>()
        //进行查询数据操作
        sqlHandle?.searchData(withReeuest: request, inTable: "groupTable", searchFinish: {
            (success, dataArray) in
            //遍历查询到的数据，赋值进结果数组中
            dataArray?.forEach({(element) in
                array.append(element.values.first! as! String)
            })
        })
        return array
    }
    
    //添加记事的方法
    class func addNote(note: NoteModel){
        if !isOpen{
            self.openDataBase()
        }
        
        //创建记事表
        self.createNoteTable()
        //将记事模型转换成字典进行存储
        sqlHandle!.insertData(note.toDictionary(), intoTable: "noteTable")
    }
    
    //根据分组获取记事
    class func getNote(group:String) ->[NoteModel]{
        if !isOpen{
            self.openDataBase()
        }
        //创建查询请求
        let request = SQLiteSearchRequest()
        //设置查询条件
        request.contidion = "ownGroup=\"\(group)\""
        var array = Array<NoteModel>()
        sqlHandle?.searchData(withReeuest: request, inTable: "noteTable", searchFinish: {
            (success, dataArray) in
            dataArray?.forEach({
                (element) in
                let note = NoteModel()
                //对记事模型进行赋值
                note.time = element["time"] as! String?
                note.title = element["title"] as! String?
                note.body = element["body"] as! String?
                note.group = element["ownGroup"] as! String?
                note.noteId = element["noteId"] as! Int?
                array.append(note)
            })
        })
        return array
    }
    
    class func createNoteTable(){
        let key1 = SQLiteKeyObject()
        key1.name = "noteId"
        key1.fieldType = INTEGER
        //将noteId作为主键
        key1.modificationType = PRIMARY_KEY
        
        let key2 = SQLiteKeyObject()
        key2.name = "ownGroup"
        key2.fieldType = TEXT
        
        let key3 = SQLiteKeyObject()
        key3.name = "body"
        key3.fieldType = TEXT
        
        let key4 = SQLiteKeyObject()
        key4.name = "title"
        key4.fieldType = TEXT
        
        let key5 = SQLiteKeyObject()
        key5.name = "time"
        key5.fieldType = TEXT
        sqlHandle!.createTable(withName: "noteTable", keys: [key1,key2,key3,key4,key5])
    }
    
    //更新一条记事内容
    class func updateNote(note:NoteModel){
        if !isOpen{
            self.openDataBase()
        }
        let whileStr = "noteId = \(note.noteId!)"
        //根据主键ID来进行更新
        sqlHandle?.updateData(note.toDictionary(), intoTable: "noteTable", while: whileStr, isSecurity: true)
    }
    
    //删除一条记事
    class func deleteNote(note:NoteModel){
        if !isOpen{
            self.openDataBase()
        }
         let whileStr = "noteId = \(note.noteId!)"
        sqlHandle?.deleteData(whileStr , intoTable: "noteTable", isSecurity: true)
    }
    
    //删除一个分组，将其下所有记事删除
    class func deleteGroup(name: String){
        if !isOpen{
            self.openDataBase()
        }
        let ownGroup = "ownGroup=\"\(name)\""
        let groupName = "GroupName=\"\(name)\""
        let noteTable = "noteTable"
        let groupTable = "groupTable"
        //首先删除分组下所有记事
        sqlHandle?.deleteData(ownGroup, intoTable: noteTable, isSecurity: true)
        //再删除分组
        sqlHandle?.deleteData(groupName, intoTable: groupTable, isSecurity: true)
    }
    
    //打开数据库的方法
    class func openDataBase(){
        //获取沙盒路径
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        //进行文件名的拼接
        let file = path + "/DataBase.sqlite"
        //打开数据库，如果数据库不存在就会进行创建
        sqlHandle = SQLiteSwift3.openDB(file)
        //设置数据库打开标志
        isOpen = true
    }
    
}

