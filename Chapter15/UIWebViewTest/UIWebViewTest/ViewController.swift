//
//  ViewController.swift
//  UIWebViewTest
//
//  Created by Chris Xiong on 2019/10/10.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKNavigationDelegate  {
    
    var webView:WKWebView?
    var buttonGoBack:UIButton!
    var buttonGoForward:UIButton!
    override func viewDidLoad() {
        let width  = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //ios12以后用WKWebView
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: width, height: height-60))
        //创建网页url
        let url = URL(string: "http://www.sina.com")
        //创建请求
        let request = URLRequest(url: url!)
        //加载网页
        webView!.load(request)
        webView?.uiDelegate = self as? WKUIDelegate
        
        self.view.addSubview(webView!)
        //创建工具条
        let toolView = UIView(frame: CGRect(x: 0, y:height-60, width:  width, height: 60))
        toolView.backgroundColor = UIColor.purple
        self.view.addSubview(toolView)
        
        //添加两个功能按钮
        //后退按钮
        buttonGoBack = UIButton(frame: CGRect(x: 30, y: 20, width: 70, height:30 ))
        buttonGoBack.setTitle("后退", for: UIControl.State())
        buttonGoBack.setTitleColor(UIColor.lightGray, for: .disabled)
        buttonGoBack.addTarget(self, action: #selector(goBack), for: UIControl.Event.touchUpInside)
        //前进按钮
        buttonGoForward = UIButton(frame: CGRect(x: width-100, y: 20, width: 70, height:30 ))
        buttonGoForward.setTitle("前进", for: UIControl.State())
        buttonGoForward.setTitleColor(UIColor.lightGray, for: .disabled)
        buttonGoForward.addTarget(self, action: #selector(goForward), for: UIControl.Event.touchUpInside)
        toolView.addSubview(buttonGoBack)
         toolView.addSubview(buttonGoForward)
    }
    
    @objc func goBack(){
        webView!.goBack()
    }
    
    @objc func goForward(){
        webView!.goForward()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        buttonGoBack.isEnabled = webView.canGoBack
        buttonGoForward.isEnabled = webView.canGoForward
    }



}

