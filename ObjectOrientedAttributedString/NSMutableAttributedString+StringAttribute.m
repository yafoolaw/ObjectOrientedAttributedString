//
//  NSMutableAttributedString+StringAttribute.m
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "NSMutableAttributedString+StringAttribute.h"

@implementation NSMutableAttributedString (StringAttribute)

- (void)addStringAttribute:(id<StringAttributeProtocol>)stringAttribute {

    [self addAttribute:[stringAttribute attributeName]
                 value:[stringAttribute attributeValue]
                 range:[stringAttribute effectRange]];
}

- (void)removeStringAttribute:(id<StringAttributeProtocol>)stringAttribute {

    [self removeAttribute:[stringAttribute attributeName] range:[stringAttribute effectRange]];
}

@end
