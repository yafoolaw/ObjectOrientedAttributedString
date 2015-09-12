//
//  ForegroundColorAttribute.m
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "ForegroundColorAttribute.h"

@implementation ForegroundColorAttribute

- (NSString*)attributeName {
    
    return NSForegroundColorAttributeName;
}


- (id)attributeValue {
    
    if (self.m_foregroundColor) {
        
        return self.m_foregroundColor;
        
    } else {
        
        return [UIColor blackColor];
    }
}

@end
