# LTPickerView

### VERSION 1.0.1
### Swift 2.2
### TIME 2016-07-08 22:54:29
### Create By 老陶

### 连接地址
 * [GitHub](https://github.com/beyond521t/)
 * [Blog Of LaoTao](http://blog.devtao.com/2016/07/08/swift-LTPickerView/)
 
### 要求
*	因为使用了元组等返回结果，所以不允许在Objective-C中混编使用
 
### 使用
	
##### 返回数据类型

* resultValue 是一个元组类型
	
		/** 返回数据的结果类型 */
		typealias pickerResultType = (first: AnyObject, second: AnyObject, third: 	AnyObject, fourth: AnyObject, fifth: AnyObject)
	
		

##### UIPickerView

一、一维数组

	let array = ["1", "2", "3", "4", "5"]
    let pickerView = LTPickerView.pickerView(array, title: "一维数组")
    pickerView.setSelectedRow(2)	//选中某一行
    pickerView.show()				//显示界面
    //点击 确定/取消 的回调方法
    pickerView.resultClosure({ (pickerView, resultValue) in
                print("\(resultValue)")
            }) { (pickerView) in
                
    }

二、多维数组

	let array = [["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"], ["1", "2", "3", "4"]]
    let pickerView = LTPickerView.pickerView(array, title: "多维数组")
    //选中行数，这里必须使用(0, 0, 0, 0, 0) 这种元组格式，5个元素
    pickerView.setSelectedRows((0, 1, 2, 3, 0))
    pickerView.show()
    //点击 确定/取消 的回调方法
    pickerView.resultClosure({ (pickerView, resultValue) in
           
        }) { (pickerView) in
            
    }    
        
##### UIDatePicker

	let pickerView = LTPickerView.datePickerView(NSDate(), datePickerMode: UIDatePickerMode.Date, title: "时间选择器")
   	pickerView.show()
   	pickerView.resultClosure({ (pickerView, resultValue) in
   			//resultValue.first 是输出的`String`类型
   			//resultValue.second 是输出的`NSDate`类型
           print("\(resultValue.first), \(resultValue.second)")
       }) { (pickerView) in
           
   	}
   	
### 版本更新
####V1.0.0

First Version
	
####V1.0.1

增加时间选择器，默认选中时间功能
	