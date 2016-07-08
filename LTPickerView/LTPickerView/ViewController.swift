//
//  ViewController.swift
//  LTPickerView
//
//  Created by LaoTao on 16/7/1.
//  Copyright © 2016年 devtao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel(frame: CGRectMake(30, 200, 200, 30))
        self.view.addSubview(label)
        
//        label.attributedText = AttributedString.createAttStringMutableAttString("开始", attStr: "插入", attColor: UIColor.redColor(), textFont: UIFont.boldSystemFontOfSize(30), insertIndex: 1)
        
        createBlockButton()
    }
    
    //MARK: >> 创建 blockButton
    /** 创建 blockButton */
    func createBlockButton() -> Void {
        let blockButton = LTBlockButton(type: UIButtonType.Custom)
        blockButton.frame = CGRectMake(20, 200, 100, 40)
        blockButton.setTitle("BlockButton", forState: UIControlState.Normal)
        blockButton.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(blockButton)
        //MARK: >> button 的 block 回调
        blockButton.setClickClosure { (button) in
            //MARK: >> 创建 UIAlertView的 闭包回调
            LTBlockAlertView.showAlertDefault("Title", message: "Message", cancelTitle: "Cancel", cancel: {
                
            }, confirmTitle: "Confirm") { (plainText) in
                
            }
        }
    }
    
    //MARK: >> 一维数组
    @IBAction func stringArrayAction(sender: UIButton) {
        let array = ["1", "2", "3", "4", "5"]
        let pickerView = LTPickerView.pickerView(array, title: "一维数组")
        pickerView.setSelectedRow(2)
        pickerView.show()
        pickerView.resultClosure({ (pickerView, resultValue) in
                print("\(resultValue)")
            }) { (pickerView) in
                
        }
    }
    
    //MARK: >> 多维数组
    //多维数组，最多为五维数组
    @IBAction func elementsAction(sender: UIButton) {
        let array = [["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"]]
        let pickerView = LTPickerView.pickerView(array, title: "多维数组")
        //选中行数，这里必须使用
        pickerView.setSelectedRows((0, 1, 2, 3, 0))
        pickerView.show()
        pickerView.resultClosure({ (pickerView, resultValue) in
                LTBlockAlertView.showAlertDefault("Title", message: "\(resultValue)", cancelTitle: "Cancel", cancel: {
                    
                }, confirmTitle: "Confirm") { (plainText) in
                    
                }
            }) { (pickerView) in
                
        }
    }
    
    //MARK: >> 时间选择器
    @IBAction func datePickerAction(sender: UIButton) {
        let pickerView = LTPickerView.datePickerView(NSDate(), datePickerMode: UIDatePickerMode.Date, title: "时间选择器")
        pickerView.show()
        pickerView.resultClosure({ (pickerView, resultValue) in
            print("\(resultValue.first), \(resultValue.second)")
        }) { (pickerView) in
            
        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

