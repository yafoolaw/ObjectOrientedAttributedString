//
//  FontAttribute.m
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "FontAttribute.h"

@implementation FontAttribute

- (NSString*)attributeName {
    
    return NSFontAttributeName;
}


- (id)attributeValue {
    
    if (self.m_font) {
        
        return self.m_font;
    } else {
    
        return [UIFont systemFontOfSize:13];
    }
    
}

@end
