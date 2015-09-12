//
//  StringAttribute.h
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringAttributeProtocol.h"
#import "UIKit/UIKit.h"

@interface StringAttribute : NSObject<StringAttributeProtocol>

/**
 *  属性有效范围
 */
@property (nonatomic) NSRange m_effectRange;

@end
