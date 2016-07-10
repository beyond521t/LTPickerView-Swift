//
//  LTPickerModel.swift
//  LTPickerView
//
//  Created by LaoTao on 16/7/8.
//  Copyright © 2016年 devtao. All rights reserved.
//

import UIKit

/** 返回数据的结果类型 */
typealias pickerResultType = (first: AnyObject, second: AnyObject, third: AnyObject, fourth: AnyObject, fifth: AnyObject)

/** toolBar 高度 */
let pickerToolbarHeight: CGFloat = 40
/** UIPickerView 的高度 */
let pickerControllerHeight: CGFloat = 216

/** 屏幕宽度 */
let pickerScreenWidth = UIScreen.mainScreen().bounds.width
/** 屏幕高度 */
let pickerScreenHeight = UIScreen.mainScreen().bounds.height

/** 数据类型 分类 */
public enum LTPickerElementMode : Int {
    /** 数组 */
    case Array
    
    /** 字典 */
    case Dictionary
    
    /** 一维数组 */
    case Value
}

/**
 *  #Warning# 不要调用 这个方法
 *
 *  PickerModel
 */
class LTPickerModel: NSObject {

    /**
     *  设置ToolBar
     *
     *  @param toolCenterLabel  ToolBar的Title
     */
    class func setToolBarStyle(pickerView: LTPickerView, toolCenterLabel: UILabel) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.backgroundColor = UIColor.lightGrayColor()
        
        let leftItem = UIBarButtonItem(title: "  取消", style: UIBarButtonItemStyle.Plain, target: pickerView, action: #selector(pickerView.cancelAction))
        
        let rightItem = UIBarButtonItem(title: "确定  ", style: UIBarButtonItemStyle.Plain, target: pickerView, action: #selector(pickerView.doneAction))
        
        //追加间距对象UIBarButtonSystemItemFlexibleSpace
        let centerSpate = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        toolCenterLabel.frame = CGRectMake((UIScreen.mainScreen().bounds.size.width - 200) / 2, 0, 200, pickerToolbarHeight)
        toolCenterLabel.text = "LTPickerView"
        toolCenterLabel.textAlignment = NSTextAlignment.Center
        toolCenterLabel.font = UIFont.systemFontOfSize(14)
        centerSpate.customView = toolCenterLabel
        toolBar.items = [leftItem, centerSpate, rightItem]
        
        return toolBar
    }

}
