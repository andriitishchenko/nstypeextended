//
//  UITextField+UITextField_padding.m
//  lottomobile
//
//  Created by Andrii Tishchenko on 17.06.14.
//  Copyright (c) 2014 ignite. All rights reserved.
//
#import <objc/runtime.h> 

#import "UITextField+UITextField_padding.h"
#ifndef UITextFieldPadding
    #define UITextFieldPadding 0.0f
#endif
@implementation UITextField (UITextField_padding)
static char UIB_PROPERTY_KEY1;
static char UIB_PROPERTY_KEY2;

@dynamic paddingVertical;
@dynamic paddingHorizontal;

//==========
-(void)setPaddingVertical:(CGFloat)value
{
    NSNumber*num = [NSNumber numberWithFloat:value];
    objc_setAssociatedObject(self, &UIB_PROPERTY_KEY1, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)paddingVertical
{
    NSNumber*num = (NSNumber*)objc_getAssociatedObject(self, &UIB_PROPERTY_KEY1);
    if (!num) {
        return UITextFieldPadding;
    }
    return [num floatValue];
}
//=============
-(void)setPaddingHorizontal:(CGFloat)value
{
    NSNumber*num = [NSNumber numberWithFloat:value];
    objc_setAssociatedObject(self, &UIB_PROPERTY_KEY2, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)paddingHorizontal
{
    NSNumber*num = (NSNumber*)objc_getAssociatedObject(self, &UIB_PROPERTY_KEY2);
    if (!num) {
        return UITextFieldPadding;
    }
    return [num floatValue];
}

// custom padding
// placeholder position
- (CGRect)textRectForBounds:(CGRect)bounds {
    return [self rectForBounds:bounds];
    //CGRectInset( bounds , UITextFieldPadding , UITextFieldPadding );
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self rectForBounds:bounds];
}

-(CGRect)rectForBounds:(CGRect)bounds
{
    CGRect b1 = CGRectInset( bounds , self.paddingHorizontal , self.paddingVertical);
    if (self.leftView) {
        CGRect b2 =self.leftView.bounds;
        b1.origin.x = b1.origin.x+b2.size.width;
        b1.size.width = b1.size.width-b2.size.width;
        
    }
    return b1;
}






@end
