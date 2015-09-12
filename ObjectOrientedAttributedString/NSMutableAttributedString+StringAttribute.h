//
//  NSMutableAttributedString+StringAttribute.h
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringAttributeProtocol.h"

@interface NSMutableAttributedString (StringAttribute)

/**
 *  添加属性对象
 *
 *  @param stringAttribute 实现了StringAttributeProtocol协议的对象
 */
- (void)addStringAttribute:(id <StringAttributeProtocol>) stringAttribute;

/**
 *  删除属性对象
 *
 *  @param stringAttribute 实现了StringAttributeProtocol协议的对象
 */
- (void)removeStringAttribute:(id <StringAttributeProtocol>) stringAttribute;

@end
