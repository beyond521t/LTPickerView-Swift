//
//  LTBlockButton.swift
//  cbai
//
//  Created by LaoTao on 16/6/30.
//  Copyright © 2016年 cim120. All rights reserved.
//

import UIKit

/**
 *  LTBlockButton
 * 
 *  BlockButton 闭包回调
 */
class LTBlockButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    typealias buttonClickedClosure = (button: UIButton) -> Void
    
    //闭包
    private var buttonClosure: buttonClickedClosure?
    
    /** 设置『闭包』回调方法 */
    func setClickClosure(closure: buttonClickedClosure) -> Void {
        self.addTarget(self, action: #selector(LTBlockButton.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        buttonClosure = closure
    }
    
    //MARK: >> button 点击事件
    @objc private func buttonAction(button: UIButton) -> Void {
        if buttonClosure != nil {
            buttonClosure!(button: button)
        }
    }
}
