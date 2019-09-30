//
//  ViewController.swift
//  UISearchBarTest
//
//  Created by Chris Xiong on 2019/10/1.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let searchBar = UISearchBar(frame:CGRect(x : 20, y:200,width: 280,height: 100))
        //设置控件风格
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        //修改控件风格颜色
        searchBar.barTintColor = UIColor.red
        searchBar.placeholder = "Please input the key words"
        //设置抬头标题
        searchBar.prompt = "搜索"
        //显示控件取消按钮
        searchBar.showsCancelButton = true
        //显示控件书库按钮
        searchBar.showsBookmarkButton = true
        //显示控件搜索结果按钮
        searchBar.showsSearchResultsButton = true
        //显示控件附件视图
        searchBar.showsScopeBar = true
        //设置附件视图按钮个数和标题
        searchBar.scopeButtonTitles = ["女鞋","男装","女装","童装"]
        //设置默认选中的附件视图按钮
        searchBar.selectedScopeButtonIndex = 0
        //由于附件视图会修改搜索栏控件的frame，因此要重新设置
        searchBar.frame = CGRect(x : 20, y:200,width: 280,height: 150)
    
        self.view.addSubview(searchBar)
        
        
    }


}

