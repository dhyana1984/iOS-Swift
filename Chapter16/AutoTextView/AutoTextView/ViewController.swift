//
//  ViewController.swift
//  AutoTextView
//
//  Created by Chris Xiong on 2019/10/20.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {
    var textView: UITextView?
    override func viewDidLoad() {
        super.viewDidLoad()
        textView = UITextView()
        // Do any additional setup after loading the view.
        //设置边框
        textView?.layer.borderWidth = 1
        textView?.layer.borderColor = UIColor.gray.cgColor
        textView?.delegate = self
        self.view.addSubview(textView!)
        textView?.snp.makeConstraints{
            (make) in
            make.leading.equalTo(100)
            make.trailing.equalTo(-100)
            make.top.equalTo(150)
            make.height.equalTo(30)
        }
    }
    //监听用户输入，UITextViewDelegate协议方法
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.bounds.size.height >= 100{
            if textView.contentSize.height < textView.bounds.size.height{
                textView.snp.updateConstraints{
                    (remake) in
                    remake.height.equalTo(textView.contentSize.height)
                }
            }
        }
        
        
        if (textView.contentSize.height != textView.bounds.size.height)
            && textView.bounds.size.height < 100{
            textView.snp.updateConstraints{
                (remake) in
                    remake.height.equalTo(textView.contentSize.height)
                //将布局变化过程使用动画过度
                UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            }
        }
        return true
    }


}

