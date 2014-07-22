//
//  UIImage+sizing.h
//  extendedDemo
//
//  Created by Andrii Tishchenko on 22.07.14.
//  Copyright (c) 2014 Andrii Tishchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (sizing)
//also http://adcdownload.apple.com/wwdc_2013/wwdc_2013_sample_code/ios_uiimageeffects.zip

- (UIImage *) toGrayscale;
// Resize without interpolating
- (UIImage *)resizeImageWithQuality:(CGInterpolationQuality)quality rate:(CGFloat)rate;
- (UIImage *)imageByCroppingSquareWithSize:(CGSize)size;
+ (UIImage*)getScreenshot;
- (UIImage*)getSubimageWithRect:(CGRect)rect;
@end
