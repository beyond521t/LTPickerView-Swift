//
//  AttributedString.h
//  LTPickerView
//
//  Created by LaoTao on 16/7/8.
//  Copyright © 2016年 devtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AttributedString : NSObject

+ (NSAttributedString *)createAttStringMutableAttString:(NSString *)aStr attStr:(NSString *)bStr attColor:(UIColor *)color textFont:(UIFont *)font insertIndex:(NSUInteger)index;

@end
