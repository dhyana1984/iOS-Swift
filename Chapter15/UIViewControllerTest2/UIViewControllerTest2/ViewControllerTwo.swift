//
//  ViewControllerTwo.swift
//  UIViewControllerTest2
//
//  Created by Chris Xiong on 2019/10/8.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    var data:String?
    //optional类型代理属性，遵守ViewControllerTwoProtocol协议
    var delegate:ViewControllerTwoProtocol?
    var closure: ((String) -> Void)?
    init(data: String){
        self.data = data
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.red
        let button = UIButton(frame: CGRect(x:100,y:200,width: 100,height:30))
        button.setTitle("返回", for: UIControl.State())
        button.addTarget(self, action: #selector(ret), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        let label = UILabel(frame: CGRect(x:10,y:300,width: 300, height: 30))
        label.text = data
        label.textColor = UIColor.white
        self.view.addSubview(label)
    }
    @objc func ret(){
        //反向传值，通过协议或者闭包
        //通过代理属性回调协议定义的方法从后向前传值
        //delegate?.sentData(data: "The data from the second page by protocol")
        //通过闭包从后向前传值
        self.closure!("The data from the second page by closure")
        //dismiss和present是对应的一对方法，dismiss是返回present的页面
        self.dismiss(animated: true, completion: nil)
    }
    



}

protocol ViewControllerTwoProtocol {
    func sentData(data:String)
}
