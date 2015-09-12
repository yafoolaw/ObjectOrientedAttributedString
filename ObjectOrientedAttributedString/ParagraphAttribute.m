//
//  ParagraphAttribute.m
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "ParagraphAttribute.h"

@implementation ParagraphAttribute

- (NSString*)attributeName {
    
    return NSParagraphStyleAttributeName;
}


- (id)attributeValue {
    
    if (self.m_paragraphStyle) {
        
        return self.m_paragraphStyle;
        
    } else {
        
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing      = 4;
        paragraphStyle.paragraphSpacing = 6;
        
        return paragraphStyle;
    }
}

@end
