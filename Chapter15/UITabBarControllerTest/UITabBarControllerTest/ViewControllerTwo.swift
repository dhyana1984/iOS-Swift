//
//  ViewControllerTwo.swift
//  UITabBarControllerTest
//
//  Created by Chris Xiong on 2019/10/9.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "推荐"
        self.view.backgroundColor = UIColor.green
        //使用系统风格标签
        let item = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
        self.tabBarItem = item
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
