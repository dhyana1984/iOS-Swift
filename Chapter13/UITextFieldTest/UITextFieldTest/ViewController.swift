//
//  ViewController.swift
//  UITextFieldTest
//
//  Created by Chris Xiong on 2019/9/30.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let textField = UITextField(frame: CGRect(x:20,y:50,width: 200,height: 30))
        textField.borderStyle = UITextField.BorderStyle.line
        //textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textColor  = UIColor.red
        textField.textAlignment = NSTextAlignment.center
        textField.placeholder = "Please input name"
        //输入框右边的清除按钮
        textField.clearButtonMode = UITextField.ViewMode.always
       
        //设置左右视图
//        let imageViewLeft = UIImageView(image:UIImage(named:"bird1"))
//        let imageViewRight = UIImageView(image:UIImage(named:"bird2"))
//        imageViewLeft.frame = CGRect(x:0,y:0,width: 5,height: 5)
//        imageViewRight.frame = CGRect(x:0,y:0,width: 5,height: 5)
//
//        textField.leftView = imageViewLeft
//        textField.rightView = imageViewRight
//        textField.leftViewMode = UITextField.ViewMode.whileEditing
//        textField.rightViewMode = UITextField.ViewMode.unlessEditing
        
        //设置UITextField控件的代理为当前视图控制器实例
        textField.delegate = self
         self.view.addSubview(textField)
        
    }
    //textField内容变化时的回调，用来验证输入信息
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //如果输入大于11位返回false
        if(textField.text?.count)! >= 11{
            return false
        }
        //如过输入不是数字返回false
        if(string.first)! < "0" || (string.first)! > "9"{
            return false
        }
        return true
    }


}

