//
//  WaterFallLayout.swift
//  UICollectionViewWaterFallTest
//
//  Created by Chris Xiong on 2019/10/15.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class WaterFallLayout: UICollectionViewFlowLayout {
    //封装一个属性用于设置item个数
    let itemCount:Int
    //添加一个数组属性，存放每个ItemDe布局信息
    var attributeArray:Array<UICollectionViewLayoutAttributes>?
    //实现构造方法
    required init?(coder aDecoder: NSCoder) {
        itemCount = 0
        super.init(coder: aDecoder)
    }
    //自定义一个构造方法
    init(itemCount:Int){
        self.itemCount = itemCount
        super.init()
    }
    
    
    override func prepare() {
        //调用父类的准备方法
        super.prepare()
        //设置为竖直布局
        self.scrollDirection = .vertical
        //初始化数组
        attributeArray = Array<UICollectionViewLayoutAttributes>()
        //先计算每个item的宽度，默认2列布局
        let WIDTH = (UIScreen.main.bounds.size.width - self.minimumInteritemSpacing)/2
        //定义一个元祖标识每一列的动态高度
        var queueHeight:(one:Int,two:Int) = (0,0)
        //进行循环设置
        for index in 0..<self.itemCount{
            //设置IndexPath, 默认设置1个分区
            let indexPath = IndexPath(item: index, section:0)
            //创建布局属性类
            let attris = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            //随机一个高度，40-190之间
            let height:Int = Int(arc4random()%150+40)
            //哪一列高度小，就把它放在哪一列下面
            //标记放在哪一列
            var queue = 0
            if queueHeight.one <= queueHeight.two{
                queueHeight.one += (height+Int(self.minimumInteritemSpacing))
                queue = 0
            }else{
                queueHeight.two += (height+Int(self.minimumInteritemSpacing))
                queue = 1
            }
            
            let tmpH = queue == 0 ? queueHeight.one - height : queueHeight.two - height
            attris.frame = CGRect(x:(self.minimumInteritemSpacing + WIDTH) * CGFloat(queue), y : CGFloat(tmpH),width: WIDTH,height: CGFloat(height))
            //添加到数组中
            attributeArray?.append(attris)
        }
        //以最大一列的高度作为计算每个Item平均高度的中间值，这样可以保证滑动范围正确
        if queueHeight.one <= queueHeight.two{
            self.itemSize = CGSize(width: WIDTH,height:CGFloat(queueHeight.two*2/self.itemCount) - self.minimumLineSpacing)
        }else{
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.one * 2/self.itemCount) - self.minimumLineSpacing)
        }
    }
    
    //实现这个方法，将设置好的存放每个item布局信息的数组返回
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray
    }
    
    
}
