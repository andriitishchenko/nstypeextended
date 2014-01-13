//
//  UIViewController+ViewControllerCategory.m
//  MEP
//
//  Created by Andrii Tishchenko on 21.10.13.
//  Copyright (c) 2013 cpcs. All rights reserved.
//

#import "UIViewController+ViewControllerCategory.h"

@implementation UIViewController (ViewControllerCategory)
- (void)containerRemoveChildViewController:(UIViewController *)childViewController {
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}
- (void)containerAddChildViewController:(UIViewController *)childViewController {
    [self addChildViewController:childViewController];
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}
@end
