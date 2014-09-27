//
//  UITextField+UITextField_padding.h
//  lottomobile
//
//  Created by Andrii Tishchenko on 17.06.14.
//  Copyright (c) 2014 ignite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (UITextField_padding)
@property (nonatomic,setter = setPaddingVertical:) CGFloat paddingVertical;
@property (nonatomic,setter = setPaddingHorizontal:) CGFloat paddingHorizontal;
//-(CGRect)rectForBounds:(CGRect)bounds;
@end
