//
//  LTPickerViewModel.swift
//  LTPickerView
//
//  Created by LaoTao on 16/7/2.
//  Copyright © 2016年 devtao. All rights reserved.
//

import UIKit


/**
 *  #Warning# 不要调用 这个方法
 *
 *  选择器 的viewModel
 */
class LTPickerViewModel: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    /** 数据源 */
    private var dataSource: [AnyObject]!
    
    /** 当前所选类型 */
    private var elementMode: LTPickerElementMode = LTPickerElementMode.Value
    
    private var pickerView: UIPickerView!
    
    /** 回调值 */
    var resultValue: pickerResultType = (first: "", second: "", third: "", fourth: "", fifth: "")
    
    //MARK: >> 创建 UIPickerView
    /** 创建 UIPickerView */
    func createPickerView(superView: UIView, data: [AnyObject]) -> UIPickerView {
        
        dataSource = data
        setArrayClass(dataSource)
        
        pickerView = UIPickerView(frame: CGRectMake(0, pickerScreenHeight - pickerControllerHeight, pickerScreenWidth, pickerControllerHeight))
        superView.addSubview(pickerView)
        pickerView.backgroundColor = UIColor.whiteColor()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setDefaultSelectValue()
        return pickerView
    }
    
    //MARK: >> 设置默认选中值
    private func setDefaultSelectValue() -> Void {
        if elementMode == LTPickerElementMode.Array {
            setSelectedRows((0, 0, 0, 0, 0))
        }else {
            setSelectedRow(0)
        }
    }
    
    func setSelectedRow(row: Int) -> Void {
        if row < dataSource.count {
            resultValue.first = dataSource[row]
            pickerView.selectRow(row, inComponent: 0, animated: true)
        }
    }
    
    func setSelectedRows(rows: pickerResultType) -> Void {
        let selectRows = (
            first: rows.first as! Int,
            second: rows.second as! Int,
            third: rows.third as! Int,
            fourth: rows.fourth as! Int,
            fifth: rows.fifth as! Int
        )
        
        if dataSource.count > 0 {
            let element = dataSource[0] as! [AnyObject]
            if selectRows.first < element.count {
                resultValue.first = element[selectRows.first]
                pickerView.selectRow(selectRows.first, inComponent: 0, animated: true)
            }
        }
        if dataSource.count > 1 {
            let element = dataSource[1] as! [AnyObject]
            if selectRows.second < element.count {
                resultValue.second = element[selectRows.second]
                pickerView.selectRow(selectRows.second, inComponent: 1, animated: true)
            }
        }
        if dataSource.count > 2 {
            let element = dataSource[2] as! [AnyObject]
            if selectRows.third < element.count {
                resultValue.third = element[selectRows.third]
                pickerView.selectRow(selectRows.third, inComponent: 2, animated: true)
            }
        }
        if dataSource.count > 3 {
            let element = dataSource[3] as! [AnyObject]
            if selectRows.fourth < element.count {
                resultValue.fourth = element[selectRows.fourth]
                pickerView.selectRow(selectRows.fourth, inComponent: 3, animated: true)
            }
        }
        if dataSource.count > 4 {
            let element = dataSource[4] as! [AnyObject]
            if selectRows.fifth < element.count {
                resultValue.fifth = element[selectRows.fifth]
                pickerView.selectRow(selectRows.fifth, inComponent: 4, animated: true)
            }
        }
    }
    
    //MARK: >> delegate && dataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if elementMode == .Array {
            return dataSource.count
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if elementMode == .Array {
            if component >= dataSource.count {
                return 0
            }
            
            if elementMode == LTPickerElementMode.Array {
                let element = dataSource[component] as! [AnyObject]
                return element.count
            }
        }
        return dataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if elementMode == .Array {
            let element = dataSource[component] as! [AnyObject]
            return element[row].description
        }
        return dataSource[row].description
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setResultValue(row, component: component)
    }
    
    /** 判断数组元素的类型 */
    private func setArrayClass(array: [AnyObject]) -> Void {
        
        for item in array {
            if (item as? [AnyObject]) != nil {  //多维数组
                for index in 0...array.count {
                    setResultValue(0, component: index)
                }
                elementMode = LTPickerElementMode.Array
                break
            }else { //一维数组
                elementMode = LTPickerElementMode.Value
                resultValue.first = item
            }
            
            break
        }
    }
    
    //MARK: >> 设置值
    //拆分多维数组， 获取内部属性，到 输出结果中去
    private func setResultValue(row: Int, component: Int) {
        
        if component >= dataSource.count {
            return
        }
        
        if elementMode == LTPickerElementMode.Array {
            let element = dataSource[component] as! [AnyObject]
            //判断是否有空数组， 空的 使用 "" 代替默认值
            let result = element[row]
            switch component {
            case 0:
                resultValue.first = result
            case 1:
                resultValue.second = result
            case 2:
                resultValue.third = result
            case 3:
                resultValue.fourth = result
            default:
                resultValue.fifth = result
            }
            print("\(resultValue)")
        }else {
            resultValue.first = dataSource[row]
        }
        
    }
}







































