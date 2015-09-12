//
//  ParagraphAttribute.h
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "StringAttribute.h"

@interface ParagraphAttribute : StringAttribute

@property (nonatomic, strong) NSMutableParagraphStyle *m_paragraphStyle;

@end
