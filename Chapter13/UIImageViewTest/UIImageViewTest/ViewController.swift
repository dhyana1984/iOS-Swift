//
//  ViewController.swift
//  UIImageViewTest
//
//  Created by Chris Xiong on 2019/9/30.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "pic1")
        let imageView = UIImageView(image:image)
        imageView.frame = CGRect(x:30,y:30,width:200,height:200)
        self.view.addSubview(imageView)
        
        var imageArray = Array<UIImage>()
        for index in 1...5{
            let birdImage = UIImage(named: "bird\(index)")
            imageArray.append(birdImage!)
            
        }
        let birdImageView = UIImageView(frame: CGRect(x:30,y:250,width: 200,height: 100))
        //设置动画组
        birdImageView.animationImages = imageArray
        //设置动画播放时长，在x秒内播放完动画
        birdImageView.animationDuration = 1
        //设置动画播放次数，0就是无限循环
        birdImageView.animationRepeatCount = 0
        self.view.addSubview(birdImageView)
        //开始播放动画，停下播放就是stopAnimating()
        birdImageView.startAnimating()
        
        
    }


}

