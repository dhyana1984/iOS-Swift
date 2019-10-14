//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by Chris Xiong on 2019/10/14.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建集合视图布局类
        let layout = UICollectionViewFlowLayout()
        //设置布局方向为竖直方向
        layout.scrollDirection = .vertical
        //设置每个数据载体的尺寸
        layout.itemSize = CGSize(width: 100, height: 100)
        //设置边距
        layout.sectionInset = UIEdgeInsets(top:20,left: 20,bottom: 10,right: 20)
        //创建集合视图
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        //设置代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        //注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.view.addSubview(collectionView)

        }
    
    
    //返还分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //返回每个分区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    //返回每个分区具体的数据载体item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
        
        
    }
    
    //数据载体的交互方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("第\(indexPath.row)个item被点击")
    }
    
    //动态设置每个Item的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.row % 2) == 0{
            return CGSize(width: 50, height: 50)
        }else{
            return CGSize(width: 100, height: 100)
        }
    }

}



