//
//  UITextField+UITextField_padding.m
//  lottomobile
//
//  Created by Andrii Tishchenko on 17.06.14.
//  Copyright (c) 2014 ignite. All rights reserved.
//
#import <objc/runtime.h> 

#import "UITextField+UITextField_padding.h"
#define UITextFieldPadding 5.0f
@implementation UITextField (UITextField_padding)
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
    CGRect b1 = CGRectInset( bounds , UITextFieldPadding , UITextFieldPadding );
    if (self.leftView) {
        CGRect b2 =self.leftView.bounds;
        b1.origin.x = b1.origin.x+b2.size.width;
        b1.size.width = b1.size.width-b2.size.width;
        
    }
    return b1;
}
@end
