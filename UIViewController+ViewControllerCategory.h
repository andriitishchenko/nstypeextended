//
//  UIViewController+ViewControllerCategory.h
//  MEP
//
//  Created by Andrii Tishchenko on 21.10.13.
//  Copyright (c) 2013 cpcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ViewControllerCategory)
- (void)containerRemoveChildViewController:(UIViewController *)childViewController ;
- (void)containerAddChildViewController:(UIViewController *)childViewController;
@end
