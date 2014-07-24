//
//  UIView+blur.m
//  blurTest
//
#import "UIView+blur.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import "UIImage+ImageEffects.h"
#import "UIImage+sizing.h"

@implementation UIView (blur)

-(UIImage *)getSnapshot{
    UIImage *snapshotImage;
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    } else {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return snapshotImage;
}

-(UIImage *)getBlurredSnapshot
{
    UIImage *snapshotImage = [self getSnapshot];
    return [snapshotImage applySmallLightEffect];
}

-(UIImage*)blurredImageOnView:(UIView*)parentView
{
    UIImage *blurredSnapshotImage;
    UIGraphicsBeginImageContextWithOptions(parentView.bounds.size, NO, self.window.screen.scale);
    [parentView drawViewHierarchyInRect:parentView.bounds afterScreenUpdates:NO];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGRect rect2 = [self convertRect:self.bounds toView:parentView];
    UIGraphicsBeginImageContext(self.bounds.size);
    [snapshotImage drawAtPoint:CGPointMake(rect2.origin.x,-rect2.origin.y)];
    blurredSnapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIColor *tintColor = [UIColor colorWithRed:100 green:100 blue:100 alpha:0.5];
     blurredSnapshotImage = [blurredSnapshotImage applyBlurWithRadius:9.0 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
    return blurredSnapshotImage;
}

-(void)blurBackgroundOnView:(UIView*)parentView
{
    UIImage *blurredBG = [self blurredImageOnView:parentView];
    self.backgroundColor = [UIColor colorWithPatternImage:blurredBG];
}

@end
