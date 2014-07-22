//
//  UIView+blur.h
//
//  Copyright (c) 2014 Andrux..
//

#import <UIKit/UIKit.h>

@interface UIView (blur)
-(UIImage *)getSnapshot;
-(UIImage *)getBlurredSnapshot;
-(UIImage *)blurredImageOnView:(UIView*)parentView;
-(void)blurBackgroundOnView:(UIView*)parentView;
@end
