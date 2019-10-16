//
//  ViewController.swift
//  GIFAnimation
//
//  Created by Chris Xiong on 2019/10/16.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit
import ImageIO
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
//        self.view.addSubview(imageView)
//        self.playGIFOnImageView(name: "bird", imageView: imageView)
        let webView = WKWebView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        self.view.addSubview(webView)
        self.playGIFOnWebView(name: "bird", webView: webView)
    }
    
    //通过ImageView加载gif
    func playGIFOnImageView(name:String, imageView:UIImageView){
        //创建素材路径
        let path = Bundle.main.path(forResource: name, ofType: "gif")
        //通过路径创建素材url
        let url = URL.init(fileURLWithPath: path!)
        //创建素材实例
        let source = CGImageSourceCreateWithURL(url as CFURL, nil)
        //获取素材中图片的张数
        let count = CGImageSourceGetCount(source!)
        //创建数组用于存放所有图片
        var imageArray = Array<UIImage>()
        //创建数组用于存放图片的宽度
        var imageWidth = Array<Int>()
        //创建数组用于存放图片高度
        var imageHeight = Array<Int>()
        //用于存放GIF播放时长
        var time: Int = Int()
        //遍历素材
        for index in 0..<count{
            //从素材实例中获取图片
            let image = CGImageSourceCreateImageAtIndex(source!, index, nil)
            //将图片加入数组中
            imageArray.append(UIImage(cgImage: image!))
            //获取图片信息数组
            let info = CGImageSourceCopyPropertiesAtIndex(source!, index, nil) as! Dictionary<String,AnyObject>
            //获取宽高
            let width  = Int(truncating: info[kCGImagePropertyPixelWidth as String]! as! NSNumber)
            let height = Int(truncating: info[kCGImagePropertyPixelHeight as String]! as! NSNumber)
            imageWidth.append(width)
            imageHeight.append(height)
            //获取时间信息
            let timeDic = info[kCGImagePropertyGIFDictionary as String] as! Dictionary<String, AnyObject>
            //进行时间累加
            time += Int(truncating: timeDic[kCGImagePropertyGIFDelayTime as String] as! NSNumber)
 
            
        }
         //重设imageView尺寸
         //大部分GIF文件中的图片尺寸相同，这里随便选取一个
         imageView.frame = CGRect(x: 30, y:100,width: imageWidth[0],height: imageHeight[0])
         //进行动画播放
        imageView.animationImages = imageArray
        imageView.animationDuration = TimeInterval(time)
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        
    }
    
    //通过WebView加载gif
    func playGIFOnWebView(name:String, webView:WKWebView){
        //创建素材路径
        let path = Bundle.main.path(forResource: name, ofType: "gif")
        //通过路径创建素材url
        let url = URL.init(fileURLWithPath: path!)
        //将GIF素材读取成Data数据
        let imageData = try! Data(contentsOf:url)
        //设置WebView不许滚动
        webView.scrollView.bounces = false
//        //设置WebView背景色透明
//        webView.backgroundColor = UIColor.clear
//        //设置WebView自适应缩放
//        webView.scalesLargeContentImage = true
        //加载gif数据
        webView.load(imageData, mimeType: "image/gif", characterEncodingName: "", baseURL: URL(string: Bundle.main.bundlePath)!)
        
        
        
    }


}

