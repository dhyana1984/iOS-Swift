//
//  ViewController.swift
//  SnapKitTest
//
//  Created by Chris Xiong on 2019/10/20.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        //使用约束之前必须将视图添加到其父视图上
        self.view.addSubview(view)
        //使用snapkit添加约束
        view.snp.makeConstraints{
            (make) in
//            make.left.equalTo(20)
//            make.right.equalTo(-20)
//            make.top.equalTo(20)
//            make.bottom.equalTo(-20)
            make.left.top.equalTo(20)
            make.right.bottom.equalTo(-20)
        }
        
        //更新约束
//        view.snp.updateConstraints(<#T##closure: (ConstraintMaker) -> Void##(ConstraintMaker) -> Void#>)
        //移除约束
//        view.snp.removeConstraints()
        
    }


}

