//
//  LTPickerView.swift
//  LTPickerView
//
//  Created by LaoTao on 16/7/1.
//  Copyright © 2016年 LaoTao. All rights reserved.
//
//  Version 1.0.1
//  Swift 2.2
//  2016-07-08 16:01:41
//  email: tao_baitong@163.com

import UIKit

protocol LTPickerViewDelegate : NSObjectProtocol {
    func toolBarDoneClicked(pickerView: LTPickerView, result: String)
}

/**
 *  LTPickerView
 */
class LTPickerView: UIView {
    
    /** 代理 */
//    var delegate: LTPickerViewDelegate?
    
    /** 点击确定 的 闭包回调 */
    typealias doneClickClosure = (pickerView: LTPickerView, resultValue: pickerResultType) -> Void
    
    /** 点击取消 的 闭包回调 */
    typealias cancelClickClosure = (pickerView: LTPickerView) -> Void
    
    private var doneClosure: doneClickClosure?
    
    private var cancelClosure: cancelClickClosure?
    
    
    /** 选择器 viewModel */
    private var pickerViewModel: LTPickerViewModel?
    
    /** 时间选择器 viewModel */
    private var dateModel: LTDatePickerModel?
    
    /** toolBar */
    private var toolBar: UIToolbar!
    
    /** toolBar Title */
    private var toolCenterLabel: UILabel!
    
    //数组类型的pickerView
    class func pickerView(data: [AnyObject], title: String) -> LTPickerView {
        let pickerView = LTPickerView()
        pickerView.customPickerView(data)
        pickerView.toolCenterLabel.text = title
        return pickerView
    }
    
    //时间的pickerView
    class func datePickerView(date: NSDate, datePickerMode: UIDatePickerMode, title: String) -> LTPickerView {
        let pickerView = LTPickerView()
        pickerView.customDatePicker(date, datePickerMode: datePickerMode)
        pickerView.toolCenterLabel.text = title
        return pickerView
    }
    
    /** pickerView 返回的 闭包回调 */
    func resultClosure(doneClick: doneClickClosure, cancelClick: cancelClickClosure) -> Void {
            doneClosure = doneClick
            cancelClosure = cancelClick
    }
    
    
    private func customPickerView(data: [AnyObject]) -> Void {
        customUI()
        pickerViewModel = LTPickerViewModel()
        pickerViewModel?.createPickerView(self, data: data)
    }

    private func customDatePicker(date: NSDate, datePickerMode: UIDatePickerMode) -> Void {
        customUI()
        dateModel = LTDatePickerModel()
        dateModel?.createDateView(self, date: date, datePickerMode: datePickerMode)
    }
    
    private func customUI() -> Void {
        //设置区域
        self.frame = CGRectMake(0, 0, pickerScreenWidth, pickerScreenHeight)
        
        //黑色 半透明背景
        let backgroundImg = UIImageView(frame: self.bounds)
        backgroundImg.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        self.addSubview(backgroundImg)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        self.addGestureRecognizer(tap)
        
        //创建 toolBar
        setToolBar()
    }
    
    //MARK: >> 创建 toolBar 
    private func setToolBar() -> Void {
        toolCenterLabel = UILabel()
        
        toolBar = LTPickerModel.setToolBarStyle(self, toolCenterLabel: toolCenterLabel)
        toolBar.frame = CGRectMake(0, pickerScreenHeight - pickerControllerHeight - pickerToolbarHeight, pickerScreenWidth, pickerToolbarHeight)
        self.addSubview(toolBar)
    }
    
    /** 选中行数 */
    func setSelectedRow(row: Int) -> Void {
        if pickerViewModel != nil {
            pickerViewModel?.setSelectedRow(row)
        }
    }
    
    /** 选中多个列的行数 格式 (first: Int, second: Ind, third: Int, fourth: Int, fifth: Int)*/
    func setSelectedRows(rows: pickerResultType) -> Void {
        if pickerViewModel != nil {
            pickerViewModel?.setSelectedRows(rows)
        }
    }
    
    
    @objc private func tapGesture() -> Void {
        removeAction()
    }
    
    func cancelAction() -> Void {
        removeAction()
    }
    
    func doneAction() -> Void {
        
        if pickerViewModel != nil {
            doneClosure?(pickerView: self, resultValue: pickerViewModel!.resultValue)
        }else if dateModel != nil {
            doneClosure?(pickerView: self, resultValue: dateModel!.getDatePickerTimeValue())
        }
        removeAction()
    }
    
    /** 移除视图 */
    private func removeAction() -> Void {
        self.removeFromSuperview()
    }
    
    func show() -> Void {
        let window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(self)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

































