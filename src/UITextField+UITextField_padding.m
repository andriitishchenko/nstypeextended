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
    return CGRectInset( bounds , UITextFieldPadding , UITextFieldPadding );
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , UITextFieldPadding , UITextFieldPadding );
}
@end
