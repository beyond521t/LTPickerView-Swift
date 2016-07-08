//
//  LTBlockAlertView.swift
//  LTPickerView
//
//  Created by LaoTao on 16/7/2.
//  Copyright © 2016年 devtao. All rights reserved.
//

import UIKit

class LTBlockAlertView: UIAlertView, UIAlertViewDelegate {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    /*
     @property(copy,nonatomic)void (^cancelClicked)();
     
     //@property(copy,nonatomic)void (^confirmClicked)();
     
     @property (copy, nonatomic)void (^confirmClicked)(NSString *plainText);
     
    //增加plainText的返回值
    -(id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonWithTitle:(NSString *)cancelTitle cancelBlock:(void (^)())cancelblock confirmButtonWithTitle:(NSString *)confirmTitle confrimBlock:(void (^)())confirmBlock{
    self=[super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:confirmTitle, nil];
    if (self) {
    _cancelClicked=[cancelblock copy];
    _confirmClicked=[confirmBlock copy];
    }
    return self;
    }
    */
    
    typealias buttonClickedClosure = (button: UIButton) -> Void
    
    //闭包
    var buttonClosure: buttonClickedClosure?
    
    /** 取消 */
    typealias alertCancelClosure = () -> Void
    
    /** 确认 */
    typealias alertConfirmClosure = (plainText: String) -> Void
    
    /** 取消的闭包 */
    private var cancelClosure: alertCancelClosure?
    
    /** 确认的闭包 */
    private var confirmClosure: alertConfirmClosure?
    
//     public convenience init(title: String, message: String, delegate: UIAlertViewDelegate?, cancelButtonTitle: String?, otherButtonTitles firstButtonTitle: String, _ moreButtonTitles: String...)
    
    
    private class func customInit(title: String, message: String, cancelTitle: String, cancel: alertCancelClosure, confirmTitle: String, confirm: alertConfirmClosure) -> LTBlockAlertView {
        
        let alertView = LTBlockAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: cancelTitle, otherButtonTitles: confirmTitle)
        
        alertView.cancelClosure = cancel
        alertView.confirmClosure = confirm
        
        return alertView
    }
    
    /**
     *  显示一个警告框
     *
     *  没有代理操作
     *
     */
    class func showAlert(title: String, message: String, cancelButtonTitle: String) -> Void {
        let alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: cancelButtonTitle)
        alertView.show()
    }
    
    /**
     *  显示默认格式的AlertView
     *
     *  @param alertCancelClosure  取消Closure
     *
     *  @param alertConfirmClosure 确认Closure
     *
     */
    class func showAlertDefault(title: String, message: String, cancelTitle: String, cancel: alertCancelClosure, confirmTitle: String, confirm: alertConfirmClosure) -> Void {
        
        let alert = LTBlockAlertView.customInit(title, message: message, cancelTitle: cancelTitle, cancel: cancel, confirmTitle: confirmTitle, confirm: confirm)
        
        alert.show()
    }

    //MARK: >> delegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if alertView.cancelButtonIndex != buttonIndex { //Confirm
            if confirmClosure != nil {
                confirmClosure!(plainText: "")
            }
        }else { //Cancel
            if cancelClosure != nil {
                cancelClosure!()
            }
        }
    }
}
