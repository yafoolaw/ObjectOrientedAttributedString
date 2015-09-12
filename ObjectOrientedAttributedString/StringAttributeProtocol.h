//
//  StringAttributeProtocol.h
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StringAttributeProtocol <NSObject>

#pragma mark - 必须实现

@required

/**
 *  属性名
 *
 *  @return 属性名
 */
- (NSString*)attributeName;

/**
 *  属性对应的值
 *
 *  @return 属性对应的值
 */
- (id)attributeValue;

@optional

/**
 *  属性的生效范围
 *
 *  @return 属性的生效范围
 */
- (NSRange)effectRange;


@end
