//
//  ViewController.swift
//  UIPickerViewTest
//
//  Created by Chris Xiong on 2019/10/1.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    //返回选择器控件的分组数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //返回选择器控件每个分组的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    //返回选择器控件每个分组中每行数据的标题
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "第\(component +  1)组, 第\(row)行"
    }
    //对选择器文本进行属性自定义
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        //创建属性字符串
        let attri = NSMutableAttributedString(string:"第\(component +  1)组, 第\(row)行")
        //为属性字符串添加颜色属性
        attri.addAttributes([NSAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location:0,length:attri.length))
        return attri
    }
    //选中一条数据时，系统调用如下协议方法
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("用户选择了\(component)组，\(row)行")
    }
    
    //设置选择器控件各个组行宽
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0{ //第一组宽度
            return 180
        }else{              //第二组宽度
            return 100
        }
    }
    
    //设置选择器控件各个组行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pickerView = UIPickerView(frame: CGRect(x:20, y:200,width:350, height: 200))
        //设置代理
        pickerView.delegate = self
        //设置数据源
        pickerView.dataSource = self
        //将选择器控件添加到当前视图上
        self.view.addSubview(pickerView)
        
        
    }


}

