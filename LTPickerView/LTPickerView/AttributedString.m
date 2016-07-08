//
//  AttributedString.m
//  LTPickerView
//
//  Created by LaoTao on 16/7/8.
//  Copyright © 2016年 devtao. All rights reserved.
//

#import "AttributedString.h"

@implementation AttributedString

//- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg;

+ (NSAttributedString *)createAttStringMutableAttString:(NSString *)aStr attStr:(NSString *)bStr attColor:(UIColor *)color textFont:(UIFont *)font insertIndex:(NSUInteger)index {
    
    NSMutableAttributedString *attMutableStr = [[NSMutableAttributedString alloc] initWithString:aStr];
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:bStr attributes:
                                  @{
                                    NSFontAttributeName: [UIFont systemFontOfSize:14],
                                    NSForegroundColorAttributeName: [UIColor redColor]
                                    }];
    [attMutableStr insertAttributedString:attStr atIndex:index];
    return  attMutableStr;
}

@end
