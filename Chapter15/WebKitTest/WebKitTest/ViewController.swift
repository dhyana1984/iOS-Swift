//
//  ViewController.swift
//  WebKitTest
//
//  Created by Chris Xiong on 2019/10/11.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body,message.name)
    }
    

    var wkView:WKWebView?
    var progressView:UIProgressView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //创建网页配置
        let configuration = WKWebViewConfiguration()
        
        //配置进程池
        let processPool = WKProcessPool()
        configuration.processPool = processPool
        
        //偏好配置
        let preference = WKPreferences()
        //设置网页界面最小字号
        preference.minimumFontSize = 0
        //设置是否支持JavaScript脚本，默认为true
        preference.javaScriptEnabled = true
        //是否允许不经过用户交互由js打开窗口，简单理解为是否允许自动弹窗
        preference.javaScriptCanOpenWindowsAutomatically = true
        
        //进行原生与JS交互配置
        let userContentController = WKUserContentController()
        //设置代理并且注册要被JS代码调用的原生方法名称
        userContentController.add(self, name:"nativeFunc")
        //向网页中注入一段js代码
        //加载网页时执行userFunc() js方法，实际上是调用原生nativeFunc并且发送消息{"class":"Five"}
        //在WKScriptMessageHandler协议的userContentController方法中处理
        let javaScriptString =
            "function userFunc() { window.webkit.messageHandlers.nativeFunc.postMessage({\"class\":\"Five\"}) }; userFunc()"
        let userScript = WKUserScript(source: javaScriptString, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        //注入
        userContentController.addUserScript(userScript)
        
        
        configuration.userContentController = userContentController
        configuration.preferences = preference
        
        //对网页视图进行实例化
        wkView = WKWebView(frame: self.view.frame, configuration: configuration)
        self.view.addSubview(wkView!)
        let url = URL(string:"https://www.qq.com")
        let request = URLRequest(url:url!)
        wkView!.load(request)
            
        //创建进度条控件
        progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 10))
        progressView?.progressTintColor = UIColor.green
        progressView?.progress = 0
        self.view.addSubview(progressView!)
        //对WKWebView实例的estimatedProgress属性进行监听
        wkView?.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            progressView?.progress = Float(wkView!.estimatedProgress)
        }
    }


}

