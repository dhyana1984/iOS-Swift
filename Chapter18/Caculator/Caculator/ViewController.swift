//
//  ViewController.swift
//  Caculator
//
//  Created by Chris Xiong on 2019/10/21.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController,BoardButtonInputDelegate {

    
    let board = Board()
    let screen = Screen()
    let caculator = CaculatorEngine()
    //输入是否需要刷新显示屏，下一轮计算时显示屏上次计算结果应该被清空
    var isNew = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        installUI()
        
    }
    
    func installUI(){
        self.view.addSubview(board)
        //设置代理
        board.delegate = self
        board.snp.makeConstraints(){
            (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.bottom.equalTo(-20)
            maker.height.equalTo(board.superview!.snp.height).multipliedBy(2/3.0)
        }
        
        self.view.addSubview(screen)
        screen.snp.makeConstraints(){
            (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.top.equalTo(0)
            maker.bottom.equalTo(board.snp.top)
        }
    }
    
    func boardButtonClick(content: String) {
        //如果是这些功能按钮，则进行逻辑处理
        if content == "AC" || content == "Delete" || content == "="{
            //进行功能逻辑处理
            switch content{
            case "AC":
                screen.clearContent()
                screen.refreshHistory()
            case "Delete":
                screen.deleteInput()
            case "=":
                let result = caculator.caculateEquation(equation: screen.inputString)
                //先刷新历史
                screen.refreshHistory()
                //清除输入的内容
                screen.clearContent()
                //将结果输入
                screen.inputContent(content: String(result))
                isNew = true
            default:
                screen.refreshHistory()
            }
        }else{
            if isNew{
                screen.clearContent()
                isNew = false
            }
            screen.inputContent(content: content)
        }
        
    }


}

