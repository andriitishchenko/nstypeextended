//
//  UIButton+isSelected.m
//
//  Created by Andrii Tishchenko on 17.12.13.
//  Copyright (c) 2013 Andrii Tishchenko. All rights reserved.
//

#import "UIButton+isSelected.h"
#import <objc/runtime.h>
@implementation UIButton (isSelected)
static char UIB_PROPERTY_KEY;

@dynamic isSelected;

-(void)setIsSelected:(BOOL)status
{
    NSNumber*num = [NSNumber numberWithBool:status];
    objc_setAssociatedObject(self, &UIB_PROPERTY_KEY, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isSelected
{
    NSNumber*num = (NSNumber*)objc_getAssociatedObject(self, &UIB_PROPERTY_KEY);
    return [num boolValue];
}


@end
