//
//  ViewControllerFour.swift
//  UITabBarControllerTest
//
//  Created by Chris Xiong on 2019/10/9.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewControllerFour: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "个人中心"
        //设置提示视图背景,消息提醒
        self.tabBarItem.badgeColor = UIColor.red
        //设置提示文字
        self.tabBarItem.badgeValue = "新消息"
        self.view.backgroundColor = UIColor.orange
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
