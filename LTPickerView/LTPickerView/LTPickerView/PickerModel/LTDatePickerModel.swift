//
//  LTDatePickerModel.swift
//  LTPickerView
//
//  Created by LaoTao on 16/7/8.
//  Copyright © 2016年 devtao. All rights reserved.
//

import UIKit

/**
 *  #Warning# 不要调用 这个方法
 *
 *  时间选择器 viewModel
 */
class LTDatePickerModel: NSObject {
    
    var dateMode = UIDatePickerMode.Date
    var datePickerView: UIDatePicker?
    
    //MARK: >> 创建 UIDatePicker
    /** 创建 UIDatePicker */
    func createDateView(superView: UIView, datePickerMode: UIDatePickerMode) -> UIDatePicker {
        
        dateMode = datePickerMode
        
        let datePicker = UIDatePicker(frame: (frame: CGRectMake(0, pickerScreenHeight - pickerControllerHeight, pickerScreenWidth, pickerControllerHeight)))
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
        //设置最小时间值。目前为 1901-1-1 00:00:00
        datePicker.minimumDate = NSDate(timeIntervalSince1970: -2177481600)
        datePicker.datePickerMode = datePickerMode
        datePicker.backgroundColor = UIColor.whiteColor()
        superView.addSubview(datePicker)
        
        datePickerView = datePicker
        return datePicker
    }
    
    /** 获取 返回的时间 first: String, second: NSDate */
    func getDatePickerTimeValue() -> pickerResultType {
        /*
        case Time // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
        case Date // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
        case DateAndTime // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
        case CountDownTimer // Displays hour and minute (e.g. 1 | 53)
        */
        
        let formatter = NSDateFormatter()
        
        switch dateMode {
        case .Time:
            formatter.dateFormat = "HH:mm"
            
        case .Date:
            formatter.dateFormat = "yyyy-MM-dd"
        case .DateAndTime:
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
        case .CountDownTimer:
            formatter.dateFormat = "HH:mm"
        }
        let result = formatter.stringFromDate(datePickerView!.date)

        return (first: result, second: datePickerView!.date, third: "", fourth: "", fifth: "")
    }
}
