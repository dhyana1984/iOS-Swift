//
//  ViewController.swift
//  UICollectionViewWaterFallTest
//
//  Created by Chris Xiong on 2019/10/15.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let layout = WaterFallLayout(itemCount: 30)
        //创建集合视图
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        //设置代理和数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        //注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        //设置一个随机颜色
        cell.backgroundColor = UIColor(red:CGFloat(arc4random()%255)/255,green:CGFloat(arc4random()%255)/255,blue: CGFloat(arc4random()%255)/255,alpha: 1 )
        return cell
    }
    


}

